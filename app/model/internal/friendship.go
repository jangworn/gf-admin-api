// ==========================================================================
// This is auto-generated by gf cli tool. DO NOT EDIT THIS FILE MANUALLY.
// ==========================================================================

package internal

import (
	"github.com/gogf/gf/os/gtime"
)

// Friendship is the golang structure for table friendship.
type Friendship struct {
	Id         uint        `orm:"id,primary"  json:"id"`         //
	Applicant  string      `orm:"applicant"   json:"applicant"`  // 申请人
	Respondent string      `orm:"respondent"  json:"respondent"` // 被申请人
	Message    string      `orm:"message"     json:"message"`    // 验证留言
	CreateTime *gtime.Time `orm:"create_time" json:"createTime"` // 时间
	UpdateTime *gtime.Time `orm:"update_time" json:"updateTime"` // 更新时间
	Status     uint        `orm:"status"      json:"status"`     // 状态
}
