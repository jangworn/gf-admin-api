package socketio

import (
	"fmt"
	"gf-admin-api/app/model/chat_record"
	"gf-admin-api/app/model/chatroom_record"
	"gf-admin-api/app/model/client"
	"github.com/gogf/gf/encoding/gbase64"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	engineio "github.com/googollee/go-engine.io"
	"github.com/googollee/go-engine.io/transport"
	"github.com/googollee/go-engine.io/transport/polling"
	"github.com/googollee/go-engine.io/transport/websocket"
	socketio "github.com/googollee/go-socket.io"
	"log"
	"net/http"
	"net/url"
	"strings"
)

func CORS(r *ghttp.Request) {
	r.Response.CORSDefault()
	r.Middleware.Next()
}

type Msg struct {
	Uid     string `json:"uid"`
	Content string `json:"content"`
}

type User struct {
	Id string `json:"id"`
}

type Receive struct {
	Uid  string `json:"uid"`
	KFID string `json:"kfId"`
}

type Record struct {
	Id      int
	Content string
	Time    string
	Sender  string
}

func Server() (server *socketio.Server) {
	db := g.DB()

	pt := polling.Default

	wt := websocket.Default
	wt.CheckOrigin = func(r *http.Request) bool {
		return true
	}

	server, err := socketio.NewServer(&engineio.Options{
		Transports: []transport.Transport{
			pt,
			wt,
		},
	})
	if err != nil {
		log.Fatal(err)
	}
	g.Server().BindMiddlewareDefault(CORS)
	g.Server().BindHandler("/socket.io/", func(r *ghttp.Request) {
		server.ServeHTTP(r.Response.Writer, r.Request)
	})
	var DataEncryptionKey string
	DataEncryptionKey = g.Cfg().GetString("server.DataEncryptionKey")

	//客户端连接
	server.OnConnect("/", func(s socketio.Conn) error {
		s.SetContext("")
		fmt.Println("connect")
		s.Join("test")
		return nil
	})

	//客户登陆
	server.OnEvent("/", "signIn", func(s socketio.Conn, msg Msg) {
		fmt.Println("login")
		s.Join(msg.Uid)
	})

	//客服登陆
	server.OnEvent("/", "kfSignIn", func(s socketio.Conn, msg User) {
		s.Join(msg.Id)
		fmt.Println("客服登录:" + msg.Id)
		s.Join("kf_group")
	})

	//接收客户端消息
	server.OnEvent("/", "putQuestion", func(s socketio.Conn, msg Msg) {

		msg.Content, _ = gbase64.DecodeToString(msg.Content)
		content, _ := url.QueryUnescape(msg.Content)
		u, err := client.Model.Where("uid=?", msg.Uid).FindOne()
		if err != nil {
			log.Fatalf("查询client失败：%s", err)
		}
		//判断客户在client表中是否存在，存在更新latest_time,不存在插入客户表
		if u.Id == 0 {
			_, err := client.Model.Data(g.Map{"uid": msg.Uid, "join_time": gtime.Datetime(), "latest_time": gtime.Datetime()}).Insert()
			if err != nil {
				log.Fatalf("插入client失败：%s", err)
			}
		} else {
			_, err := client.Model.Data(g.Map{"latest_time": gtime.Datetime()}).Where("uid=?", msg.Uid).Update()
			if err != nil {
				log.Fatalf("更新client失败：%s", err)
			}
		}

		//插入用户输入内容
		//_,err = chat_record.Model.Data(g.Map{"sender":msg.Uid,"receiver":999,"content":"to_base64(aes_encrypt("+msg.Content+","+DataEncryptionKey+"))","time":gtime.Datetime()}).Insert()
		_, err = db.Query("insert into chat_record(sender,receiver,content,time) value('" + msg.Uid + "',999,to_base64(aes_encrypt('" + msg.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "');")
		if err != nil {
			log.Fatalf("问题写入失败：%s", err)
		}

		//判断客户是否和人工对话中
		if u.Id > 0 && u.Status == 3 {
			server.BroadcastToRoom("", u.KfId, "putQuestion", msg)
			fmt.Println("推送给客服：" + u.KfId)
			return
		}

		//判断是否是转人工
		if ok := strings.Contains(content, "人工"); ok {
			//更新客户状态为排队中
			_, err := client.Model.Data(g.Map{"status": 2}).Where("uid=?", msg.Uid).Update()
			if err != nil {
				log.Fatalf("更新client status失败：%s", err)
				return
			}
			g.Redis().DoVar("RPUSH", "queue_list", msg.Uid)
			queueCount, err := g.Redis().Do("LLEN", "queue_list")
			if err != nil {
				log.Fatalf("获取排队人数失败：%s", err)
			}
			server.BroadcastToRoom("", "kf_group", "queueCount", queueCount)
			server.BroadcastToRoom("", "kf_group", "enterQueue", msg)
		}

		var answer Msg
		answer.Content = "hello"
		_, err2 := db.Query("insert into chat_record(sender,receiver,content,time) value(999,'" + msg.Uid + "',to_base64(aes_encrypt('" + answer.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "');")
		if err2 != nil {
			log.Fatalf("答案写入失败：", err2)
		}
		s.Emit("reply", answer)
	})

	//客服回复
	server.OnEvent("/", "reply", func(s socketio.Conn, msg Msg) {
		msg.Content, _ = gbase64.DecodeToString(msg.Content)
		_, err2 := db.Query("insert into chat_record(sender,receiver,content,time) value(1,'" + msg.Uid + "',to_base64(aes_encrypt('" + msg.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "');")
		if err2 != nil {
			log.Fatalf("答案写入失败：", err2)
		}
		msg.Content, _ = url.QueryUnescape(msg.Content)
		server.BroadcastToRoom("", msg.Uid, "reply", msg)
		//s.Join(msg.Uid)
	})

	//客户H5初始化数据
	server.OnEvent("/", "initData", func(s socketio.Conn, msg Msg) {
		r,err := chat_record.Model.Fields("id,sender,receiver,aes_decrypt(from_base64(content),'"+DataEncryptionKey+"') as content ,time").Where("sender=?", msg.Uid).Or("receiver=?", msg.Uid).Order("time asc").All()
		if err != nil {
			log.Fatalf("初始化失败：", err)
		}
		s.Emit("initData", r)
	})

	//客服接入排队中的客户
	server.OnEvent("/", "receive", func(s socketio.Conn, msg Receive) {
		fmt.Println(msg)

		_, err1 := client.Model.Where("uid=?", msg.Uid).FindOne()
		if err1 != nil {
			log.Fatalf("查询client失败：%s", err1)
			return
		}
		_, err2 := g.Redis().DoVar("LREM", "queue_list", 0, msg.Uid)
		fmt.Println(msg.Uid)
		if err2 != nil {
			log.Fatalf("排队队列删除当前uid失败：%s", err2)
			return
		}
		//更新客户状态为接待中
		_, err3 := client.Model.Data(g.Map{"status": 3, "kf_id": msg.KFID}).Where("uid=?", msg.Uid).Update()
		if err3 != nil {
			log.Fatalf("更新client status失败：%s", err)
		}
		queueCount, err := g.Redis().Do("LLEN", "queue_list")
		if err != nil {
			log.Fatalf("获取排队人数失败：%s", err)
		}
		server.BroadcastToRoom("", "kf_group", "queueCount", queueCount)
		server.BroadcastToRoom("", "kf_group", "deleteQueueOne", msg)
		server.BroadcastToRoom("", msg.KFID, "newConversation", msg)

	})

	//结束会话
	server.OnEvent("/", "endConversation", func(s socketio.Conn, uid string) {

		if uid == "" {
			log.Fatalf("结束会话参数错误：%s", err)
			return
		}
		_, err3 := client.Model.Data(g.Map{"status": 1}).Where("uid=?", uid).Update()
		if err3 != nil {
			log.Fatalf("更新user status=1失败：%s", err)
		}

	})

	//进入聊天室
	server.OnEvent("/", "enterRoom", func(s socketio.Conn, msg User) {
		s.Join(msg.Id)
		fmt.Println("进入聊天室:" + msg.Id)
		s.Join("room")
		r, err := chatroom_record.Model.Fields("id,sender,aes_decrypt(from_base64(content),'" + DataEncryptionKey + "') as content ,time").Order("time asc").All()
		if err != nil {
			log.Fatalf("初始化失败：%s", err)
		}
		server.BroadcastToRoom("", "room", "roomLen", server.RoomLen("", "room"))
		s.Emit("initRoomData", r)
	})

	//发送内容到聊天室
	server.OnEvent("/", "sendToRoom", func(s socketio.Conn, msg Msg) {

		msg.Content, _ = gbase64.DecodeToString(msg.Content)
		content, _ := url.QueryUnescape(msg.Content)
		u, err := client.Model.Where("uid=?", msg.Uid).FindOne()
		if err != nil {
			log.Fatalf("查询user失败：%s", err)
		}
		fmt.Println(u)
		//判断客户在client表中是否存在，存在更新latest_time,不存在插入客户表
		if u == nil {
			_, err := client.Model.Data(g.Map{"uid": msg.Uid, "join_time": gtime.Datetime(), "latest_time": gtime.Datetime()}).Insert()
			if err != nil {
				log.Fatalf("插入user失败：%s", err)
			}
		} else {
			_, err := client.Model.Data(g.Map{"latest_time": gtime.Datetime()}).Where("uid=?", msg.Uid).Update()
			if err != nil {
				log.Fatalf("更新user失败：%s", err)
			}
		}

		//插入用户输入内容
		_, err = db.Query("insert into chatroom_record(sender,content,time,room_id) value('" + msg.Uid + "',to_base64(aes_encrypt('" + msg.Content + "','" + DataEncryptionKey + "')),'" + gtime.Datetime() + "',1);")
		if err != nil {
			log.Fatalf("问题写入失败：%s", err)
		}
		fmt.Println("广播:" + content)
		server.BroadcastToRoom("", "room", "broadcast", Record{Id: 1, Content: content, Time: gtime.Datetime(), Sender: msg.Uid})
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
		server.BroadcastToRoom("", "room", "roomLen", server.RoomLen("", "room"))
		fmt.Println("closed", reason)

	})
	return server

}
