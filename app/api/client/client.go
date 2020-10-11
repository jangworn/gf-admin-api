package client

import (
	"fmt"
	"gf-admin-api/app/service/client"
	"gf-admin-api/function/response"
	"github.com/gogf/gf/net/ghttp"
	"log"
)

// 客户端API管理对象
type Controller struct{}


/**
 * @summary: 客户端列表，后台展示
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/list [GET]
 * @return:
 */
func (c *Controller) List(r *ghttp.Request) {
	//page := r.Get("page")
	//limit := r.Get("limit")
	response.JsonExit(r, "", client.GetList())
}

/**
 * @summary: 好友申请列表
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/friendship [GET]
 * @return:
 */
func (c *Controller) Friendship(r *ghttp.Request){
	respondent := r.GetString("respondent")
	status := r.GetInt("status")
	response.JsonExit(r,"",client.GetFriendship(respondent,status))
}

/**
 * @summary: 同意好友申请
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /client/aggree [POST]
 * @return:
 */
func (c *Controller) Aggree(r *ghttp.Request){
	id := r.GetInt("id")
	respondent := r.GetString("respondent")
	f := client.GetFriendshipOne(id)
	if f.Respondent == respondent {
		err := client.UpdateFriendship(id,1)
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
func (c *Controller) Unfriend(r *ghttp.Request){
	id := r.GetInt("id")
	respondent := r.GetString("respondent")
	f := client.GetFriendshipOne(id)
	if f.Respondent == respondent {
		err := client.UpdateFriendship(id,2)
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
func (c *Controller) CreateChatroom(r *ghttp.Request){
	uid := r.GetString("uid")
	checkedFriends := r.GetArray("checkedFriends")
	fmt.Println(uid,checkedFriends)
	room_id,err := client.CreateChatroom()
	if err != nil{
		log.Fatalf("创建聊天室失败：%s",err)
	}
	client.InsertChatroomClient(uid,room_id,checkedFriends)

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
func (c *Controller) GetChatroomList(r *ghttp.Request){
	uid := r.GetString("uid")
	response.JsonExit(r,"",client.GetChatroomList(uid))
}


