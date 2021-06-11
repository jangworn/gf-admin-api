// ==========================================================================
// This is auto-generated by gf cli tool. DO NOT EDIT THIS FILE MANUALLY.
// ==========================================================================

package internal

import (
	"github.com/gogf/gf/os/gtime"
)

// ChatroomUser is the golang structure for table chatroom_user.
type ChatroomUser struct {
	Id         uint        `orm:"id,primary"  json:"id"`         // id
	RoomId     uint        `orm:"room_id"     json:"roomId"`     // 群聊房间id
	UserId     uint        `orm:"user_id"     json:"userId"`     // 用户id
	Nickname   string      `orm:"nickname"    json:"nickname"`   // 用户在群内昵称
	IsOwner    int         `orm:"is_owner"    json:"isOwner"`    // 是否是群主
	CreateTime *gtime.Time `orm:"create_time" json:"createTime"` // 创建时间
	UpdateTime *gtime.Time `orm:"update_time" json:"updateTime"` // 更新时间
}
