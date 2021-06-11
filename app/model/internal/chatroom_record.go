// ==========================================================================
// This is auto-generated by gf cli tool. DO NOT EDIT THIS FILE MANUALLY.
// ==========================================================================

package internal

import (
	"github.com/gogf/gf/os/gtime"
)

// ChatroomRecord is the golang structure for table chatroom_record.
type ChatroomRecord struct {
	Id         uint64      `orm:"id,primary"  json:"id"`         // id
	SenderId   uint        `orm:"sender_id"   json:"senderId"`   // 发送人id
	Content    string      `orm:"content"     json:"content"`    // 内容
	CreateTime *gtime.Time `orm:"create_time" json:"createTime"` // 创建时间
	RoomId     uint        `orm:"room_id"     json:"roomId"`     // 群聊id
}
