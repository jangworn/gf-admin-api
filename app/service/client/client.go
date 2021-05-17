package client

import (
	"gf-admin-api/app/dao"
	"gf-admin-api/app/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"log"
)



type ListInput struct {
	Page  int
	Limit int
}

// 获得客户列表
func GetList() (list []*model.Client) {
	list, _ = dao.Client.FindAll()
	return
}

func GetFriendship(respondent string,status int) (list []*model.Friendship){
	list, _ = dao.Friendship.FindAll("respondent=? and status=?",respondent,status)
	return
}

func GetFriendshipOne(id int) (one *model.Friendship){
	one, _ = dao.Friendship.FindOne("id=?",id)
	return
}

func UpdateFriendship(id,status int) (err error){
	_, err = dao.Friendship.Update(g.Map{"status":status},"id=?",id)
	return
}

func CreateChatroom() (lastInsertId int64,err error) {
	res,err := dao.Chatroom.Insert(g.Map{"name":"群聊","create_time":gtime.Datetime()})
	if err != nil{
		log.Fatalf("创建聊天室失败:%s",err)
		return 0,err
	}
	lastInsertId,_ = res.LastInsertId()

	return lastInsertId,nil
}

func InsertChatroomClient(owner string,room_id int64,checkedClient []string) (err error){

	if len(checkedClient) == 0 {
			return gerror.New("参数错误")
	}
	var list g.List
	for _,val := range checkedClient{
		list = append(list, g.Map{"room_id":room_id,"uid":val,"is_owner":0})
	}
	list = append(list, g.Map{"room_id":room_id,"uid":owner,"is_owner":1})
	dao.ChatroomClient.Data(list).Insert()
	return nil
}

func GetChatroomList(uid string) (list []*model.Chatroom){
	list, _ = dao.Chatroom.LeftJoin("chatroom_client cc","chatroom.id = cc.room_id").Fields("chatroom.id,name").Where("cc.uid=?",uid).And("chatroom.id>?",1).FindAll()
	var item = &model.Chatroom{Id:1,Name:"公共聊天室"}
	list = append([]*model.Chatroom{item},list...)
	return
}