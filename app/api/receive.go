package api

import (
	"fmt"
	"gf-admin-api/app/dao"
	"gf-admin-api/app/service"
	"gf-admin-api/function/response"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)
var Receiver = new(receiveController)
type receiveController struct{}


func (c *receiveController) GetQueueList(r *ghttp.Request) {

	list, err := service.User.QueueList()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	response.JsonExit(r, "", list)
}

func (c *receiveController) GetConversationList(r *ghttp.Request) {
	data, err := service.User.ConversationList()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	response.JsonExit(r, "", data)
}

func (c *receiveController) GetConversationMessage(r *ghttp.Request) {

	uid := r.Get("uid")
	var DataEncryptionKey string
	DataEncryptionKey = g.Cfg().GetString("server.DataEncryptionKey")

	list, err := dao.ChatRecord.Fields("id,sender,receiver,aes_decrypt(from_base64(content),'"+DataEncryptionKey+"') as content ,time").Where("sender=?", uid).Or("receiver=?", uid).OrderBy("id desc").Limit(10).All()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	var data []interface{}
	for i := len(list) - 1; i >= 0; i-- {
		data = append(data, list[i])
	}

	response.JsonExit(r, "", data)
}
