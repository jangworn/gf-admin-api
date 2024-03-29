// ==========================================================================
// This is auto-generated by gf cli tool. DO NOT EDIT THIS FILE MANUALLY.
// ==========================================================================

package internal

import (
	"github.com/gogf/gf/os/gtime"
)

// ChatRecord is the golang structure for table chat_record.
type ChatRecord struct {
	Id         int         `orm:"id,primary"  json:"id"`         // id
	SenderId   uint        `orm:"sender_id"   json:"senderId"`   // 发送人
	ReceiverId uint        `orm:"receiver_id" json:"receiverId"` // 接收人
	Content    string      `orm:"content"     json:"content"`    // 内容
	CreateTime *gtime.Time `orm:"create_time" json:"createTime"` // 创建时间
	UpdateTime *gtime.Time `orm:"update_time" json:"updateTime"` // 更新时间
	Status     int         `orm:"status"      json:"status"`     // 状态，0：未读 1：已读 2：已删除
}
