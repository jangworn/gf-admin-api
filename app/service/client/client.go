package client

import (
	"gf-admin-api/app/model/client"
	"gf-admin-api/app/model/friendship"
	"github.com/gogf/gf/frame/g"
)



type ListInput struct {
	Page  int
	Limit int
}

// 获得客户列表
func GetList() (list []*client.Entity) {
	list, _ = client.FindAll()
	return
}

func GetFriendship(respondent string,status int) (list []*friendship.Entity){
	list, _ = friendship.FindAll("respondent=? and status=?",respondent,status)
	return
}
func GetFriendshipOne(id int) (one *friendship.Entity){
	one, _ = friendship.FindOne("id=?",id)
	return
}
func UpdateFriendship(id,status int) (err error){
	_, err = friendship.Update(g.Map{"status":status},"id=?",id)
	return
}
