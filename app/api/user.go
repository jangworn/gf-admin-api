package api

import (
	"fmt"
	"gf-admin-api/app/model"
	"gf-admin-api/app/service"
	"gf-admin-api/function/response"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"log"
)

// 客户端API管理对象
var User = new(userController)
type userController struct{}


/**
 * @summary: 客户端列表，后台展示
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/list [GET]
 * @return:
 */
func (c *userController) List(r *ghttp.Request) {
	//page := r.Get("page")
	//limit := r.Get("limit")
	response.JsonExit(r, "", service.User.GetList())
}

func (c *userController) SignIn(r *ghttp.Request){
	var (
		data *model.UserReq
	)
	if err := r.Parse(&data);err != nil{
		response.JsonExit(r,  err.Error())
	}
	user,err := service.User.SignIn(data.Nickname)
	if err != nil{
		g.Log().Line().Println(err)
	}
	fmt.Println("u:",user)
	if user == nil {
		fmt.Println("u2:",user)
		user = service.User.SignUp(data.Nickname)
		fmt.Println("u3:",user)
	}
	response.JsonExit(r,"", user)
}

/**
 * @summary: 好友申请列表
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/friendship [GET]
 * @return:
 */
func (c *userController) Friendship(r *ghttp.Request){
	var (
		data *model.FriendshipReq
	)
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r,  err.Error())
	}
	response.JsonExit(r,"", service.User.GetFriendship(data.UserId,data.Status))
}

/**
 * @summary: 同意好友申请
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/aggree [POST]
 * @return:
 */
func (c *userController) Aggree(r *ghttp.Request){
	var (
		data *model.FriendshipReq
	)
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r,  err.Error())
	}
	f := service.User.GetFriendshipOne(data.Id)
	if f.RespondentId == data.UserId {
		err := service.User.UpdateFriendship(data.Id,1)
		fmt.Println("更新状态：",err)
		if err != nil{
			response.JsonExit(r,"操作失败")
		}
		response.JsonExit(r,"")
	}
	response.JsonExit(r,"参数错误")
}

/**
 * @summary: 删除好友
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/unfriend [POST]
 * @return:
 */
func (c *userController) Unfriend(r *ghttp.Request){
	var (
		data *model.FriendshipReq
	)
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r,  err.Error())
	}
	f := service.User.GetFriendshipOne(data.Id)
	if f.RespondentId == data.UserId  || f.ApplicantId == data.UserId{
		err := service.User.UpdateFriendship(data.Id,2)
		fmt.Println("更新状态：",err)
		if err != nil{
			response.JsonExit(r,"操作失败")
		}
		response.JsonExit(r,"")
	}
	response.JsonExit(r,"参数错误")
}

/**
 * @summary: 创建群聊
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/createChatroom [POST]
 * @return:
 */
func (c *userController) CreateChatroom(r *ghttp.Request){
	var (
		data *model.ChatroomReq
	)
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r,  err.Error())
	}
	room_id,err := service.User.CreateChatroom()
	if err != nil{
		log.Fatalf("创建聊天室失败：%s",err)
	}
	service.User.InsertChatroomUser(data.UserId,room_id,data.CheckedFriends)

	response.JsonExit(r,"")
}

/**
 * @summary: 群聊列表
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/getChatroomList [GET]
 * @return:
 */
func (c *userController) GetChatroomList(r *ghttp.Request){
	uid := r.GetString("uid")
	response.JsonExit(r,"", service.User.GetChatroomList(uid))
}


