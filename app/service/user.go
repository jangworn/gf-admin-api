package service

import (
	"fmt"
	"gf-admin-api/app/dao"
	"gf-admin-api/app/model"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"log"
	"math/rand"
)



type ListInput struct {
	Page  int
	Limit int
}

var User = userService{}

type userService struct {

}
//用户登录
func (s *userService)SignIn(nickname string)(u *model.UserReq,err error){
	user,err := dao.User.FindOne("nickname=?",nickname)
	if user != nil{
		u = &model.UserReq{
			Id  :user.Id,
			Nickname: user.Nickname,
		}
	}
	fmt.Println(u,err)
	return
}
//用户注册
func (s *userService)SignUp(nickname string) (u *model.UserReq){
	fmt.Println("ddd")
	u = &model.UserReq{
		Nickname: nickname,
		Uid:gconv.String(rand.Int()),
		CreateTime : gtime.Now(),
	}

	result,err := dao.User.Save(u)
	if err != nil{
		g.Log().Line().Println(err)
	}
	uid,_ := result.LastInsertId()
	u.Id = gconv.Int(uid)
	return
}
// 获得用户列表
func (s *userService)GetList() (list []*model.User) {
	list, _ = dao.User.FindAll()
	return
}

func (s *userService)GetFriendship(respondent_id uint,status int) (list []*model.Friendship){
	list, _ = dao.Friendship.FindAll("respondent_id=? and status=?",respondent_id,status)
	return
}

func (s *userService)GetFriendshipOne(id int) (one *model.Friendship){
	one, _ = dao.Friendship.FindOne("id=?",id)
	return
}

func (s *userService)UpdateFriendship(id,status int) (err error){
	_, err = dao.Friendship.Update(g.Map{"status":status},"id=?",id)
	return
}

func (s *userService)CreateChatroom() (lastInsertId int64,err error) {
	res,err := dao.Chatroom.Insert(g.Map{"name":"群聊","create_time":gtime.Datetime()})
	if err != nil{
		log.Fatalf("创建聊天室失败:%s",err)
		return 0,err
	}
	lastInsertId,_ = res.LastInsertId()

	return lastInsertId,nil
}

func (s *userService)InsertChatroomUser(owner int,room_id int64,checkedUsers []int) (err error){

	if len(checkedUsers) == 0 {
			return gerror.New("参数错误")
	}
	var list g.List
	for _,val := range checkedUsers{
		list = append(list, g.Map{"room_id":room_id,"user_id":val,"is_owner":0})
	}
	list = append(list, g.Map{"room_id":room_id,"user_id":owner,"is_owner":1})
	dao.ChatroomUser.Data(list).Insert()
	return nil
}

func (s *userService)GetChatroomList(uid string) (list []*model.Chatroom){
	list, _ = dao.Chatroom.LeftJoin("chatroom_user cc","chatroom.id = cc.room_id").Fields("chatroom.id,name").Where("cc.user_id=?",uid).And("chatroom.id>?",1).FindAll()
	var item = &model.Chatroom{Id:1,Name:"公共聊天室"}
	list = append([]*model.Chatroom{item},list...)
	return
}