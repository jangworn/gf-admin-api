package main

import (
	"fmt"
	"log"
	"net/http"
	"net/url"
	"strings"

	"github.com/gogf/gf/encoding/gbase64"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	socketio "github.com/googollee/go-socket.io"
)

type Msg struct {
	Uid     string `json:"uid"`
	Content string `json:"content"`
}

type User struct {
	Id string `json:"id"`
}

func corsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		allowHeaders := "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization"
		origin := r.Header.Get("Origin")
		if origin != "" {
			w.Header().Set("Access-Control-Allow-Origin", origin)
			w.Header().Set("Access-Control-Allow-Credentials", "true")
			w.Header().Set("Access-Control-Allow-Headers", allowHeaders)
		}

		next.ServeHTTP(w, r)
	})
}

func main() {

	db := g.DB()
	server, err := socketio.NewServer(nil)
	if err != nil {
		log.Fatal(err)
	}
	var DataEncryptionKey string
	DataEncryptionKey = g.Cfg().GetString("server.DataEncryptionKey")

	//客户端连接
	server.OnConnect("/", func(s socketio.Conn) error {
		s.SetContext("")

		s.Join("test")
		return nil
	})

	//客户登陆
	server.OnEvent("/", "signIn", func(s socketio.Conn, msg Msg) {
		s.Join(msg.Uid)
	})

	//客服登陆
	server.OnEvent("/", "kfSignIn", func(s socketio.Conn, msg User) {
		s.Join(msg.Id)
	})

	//接收客户端消息
	server.OnEvent("/", "putQuestion", func(s socketio.Conn, msg Msg) {
		user := g.DB().Table("client")
		msg.Content, _ = gbase64.DecodeToString(msg.Content)
		content, _ := url.QueryUnescape(msg.Content)
		u, err := user.Where("uid=?", msg.Uid).FindOne()
		if err != nil {
			log.Fatalf("查询user失败：%s", err)
		}
		//判断客户在client表中是否存在，存在更新latest_time,不存在插入客户表
		if len(u) == 0 {
			_, err := user.Data(g.Map{"uid": msg.Uid, "join_time": gtime.Datetime(), "latest_time": gtime.Datetime()}).Insert()
			if err != nil {
				log.Fatalf("插入user失败：%s", err)
			}
		} else {
			_, err := user.Data(g.Map{"latest_time": gtime.Datetime()}).Where("uid=?", msg.Uid).Update()
			if err != nil {
				log.Fatalf("更新user失败：%s", err)
			}
		}

		//插入用户输入内容
		_, err = db.Query("insert into ga_chat_records(sender,receiver,content,time) value('" + msg.Uid + "',999,to_base64(aes_encrypt('" + msg.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "');")
		if err != nil {
			log.Fatalf("问题写入失败：%s", err)
		}

		//判断客户是否和人工对话中
		if len(u) > 0 && u["status"].Int() == 3 {
			server.BroadcastToRoom("", "123", "putQuestion", msg)
			return
		}

		//判断是否是转人工
		if ok := strings.Contains(content, "人工"); ok {
			//更新客户状态为排队中
			_, err := user.Data(g.Map{"status": 2}).Where("uid=?", msg.Uid).Update()
			if err != nil {
				log.Fatalf("更新user status失败：%s", err)
			}
			g.Redis().DoVar("RPUSH", "in_waiting", msg.Uid)

		}

		var answer Msg
		answer.Content = "hello"
		_, err2 := db.Query("insert into ga_chat_records(sender,receiver,content,time) value(999,'" + msg.Uid + "',to_base64(aes_encrypt('" + answer.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "');")
		if err2 != nil {
			log.Fatalf("答案写入失败：", err2)
		}
		s.Emit("reply", answer)
	})

	//客服回复
	server.OnEvent("/", "reply", func(s socketio.Conn, msg Msg) {
		msg.Content, _ = gbase64.DecodeToString(msg.Content)
		_, err2 := db.Query("insert into ga_chat_records(sender,receiver,content,time) value(1,'" + msg.Uid + "',to_base64(aes_encrypt('" + msg.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "');")
		if err2 != nil {
			log.Fatalf("答案写入失败：", err2)
		}
		msg.Content, _ = url.QueryUnescape(msg.Content)
		server.BroadcastToRoom("", msg.Uid, "reply", msg)
		//s.Join(msg.Uid)
	})

	server.OnEvent("/", "initData", func(s socketio.Conn, msg Msg) {
		chatRecords := g.DB().Table("chat_records")
		r, err := chatRecords.Fields("id,sender,receiver,aes_decrypt(from_base64(content),'"+DataEncryptionKey+"') as content ,time").Where("sender=?", msg.Uid).Or("receiver=?", msg.Uid).OrderBy("time asc").All()
		if err != nil {
			log.Fatalf("初始化失败：", err)
		}
		s.Emit("initData", r)

	})
	server.OnEvent("/chat", "msg", func(s socketio.Conn, msg string) string {
		s.SetContext(msg)
		return "recv " + msg
	})
	server.OnEvent("/", "bye", func(s socketio.Conn) string {
		last := s.Context().(string)
		s.Emit("bye", last)
		s.Close()
		return last
	})
	server.OnError("/", func(s socketio.Conn, e error) {
		fmt.Println("meet error:", e)
	})
	server.OnDisconnect("/", func(s socketio.Conn, reason string) {
		fmt.Println("closed", reason)
	})

	go server.Serve()
	defer server.Close()

	http.Handle("/socket.io/", corsMiddleware(server))
	http.Handle("/", http.FileServer(http.Dir("./asset")))
	log.Println("Serving at localhost:8000...")
	log.Fatal(http.ListenAndServe(":8000", nil))
}
