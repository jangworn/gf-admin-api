// ==========================================================================
// This is auto-generated by gf cli tool. You may not really want to edit it.
// ==========================================================================

package chat_record

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table chat_record.
type Entity struct {
    Id       int         `orm:"id,primary" json:"id"`       // id      
    Sender   string      `orm:"sender"     json:"sender"`   // 发送人  
    Receiver string      `orm:"receiver"   json:"receiver"` // 接收人  
    Content  string      `orm:"content"    json:"content"`  // 内容    
    Time     *gtime.Time `orm:"time"       json:"time"`     // 时间    
}

// OmitEmpty sets OPTION_OMITEMPTY option for the model, which automatically filers
// the data and where attributes for empty values.
func (r *Entity) OmitEmpty() *arModel {
	return Model.Data(r).OmitEmpty()
}

// Inserts does "INSERT...INTO..." statement for inserting current object into table.
func (r *Entity) Insert() (result sql.Result, err error) {
	return Model.Data(r).Insert()
}

// InsertIgnore does "INSERT IGNORE INTO ..." statement for inserting current object into table.
func (r *Entity) InsertIgnore() (result sql.Result, err error) {
	return Model.Data(r).InsertIgnore()
}

// Replace does "REPLACE...INTO..." statement for inserting current object into table.
// If there's already another same record in the table (it checks using primary key or unique index),
// it deletes it and insert this one.
func (r *Entity) Replace() (result sql.Result, err error) {
	return Model.Data(r).Replace()
}

// Save does "INSERT...INTO..." statement for inserting/updating current object into table.
// It updates the record if there's already another same record in the table
// (it checks using primary key or unique index).
func (r *Entity) Save() (result sql.Result, err error) {
	return Model.Data(r).Save()
}

// Update does "UPDATE...WHERE..." statement for updating current object from table.
// It updates the record if there's already another same record in the table
// (it checks using primary key or unique index).
func (r *Entity) Update() (result sql.Result, err error) {
	return Model.Data(r).Where(gdb.GetWhereConditionOfStruct(r)).Update()
}

// Delete does "DELETE FROM...WHERE..." statement for deleting current object from table.
func (r *Entity) Delete() (result sql.Result, err error) {
	return Model.Where(gdb.GetWhereConditionOfStruct(r)).Delete()
}