// ============================================================================
// This is auto-generated by gf cli tool only once. Fill this file as you wish.
// ============================================================================

package dao

import (
	"gf-admin-api/app/dao/internal"
)

// chatRecordDao is the manager for logic model data accessing
// and custom defined data operations functions management. You can define
// methods on it to extend its functionality as you wish.
type chatRecordDao struct {
	internal.ChatRecordDao
}

var (
	// ChatRecord is globally public accessible object for table chat_record operations.
	ChatRecord = chatRecordDao{
		internal.ChatRecord,
	}
)

// Fill with you ideas below.