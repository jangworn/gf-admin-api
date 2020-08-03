package user

import (
	"database/sql"
	"fmt"

	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table user.
type Entity struct {
	ID         uint        `orm:"id,primary"  json:"id"`          // 用户ID
	Passport   string      `orm:"username"    json:"username"`    // 账号
	Password   string      `orm:"password"    json:"password"`    // 密码
	Nickname   string      `orm:"nickname"    json:"nickname"`    // 昵称
	CreateTime *gtime.Time `orm:"create_time" json:"create_time"` // 创建时间/注册时间
	Status     int         `orm:"status" json:"status"`           // 创建时间/注册时间
}

type EntityOne struct {
	//ID         uint        `orm:"id,primary"  json:"id"`          // 用户ID
	Passport   string      `orm:"username"    json:"username"`    // 账号
	Password   string      `orm:"password"    json:"password"`    // 密码
	Nickname   string      `orm:"nickname"    json:"nickname"`    // 昵称
	CreateTime *gtime.Time `orm:"create_time" json:"create_time"` // 创建时间/注册时间
	Status     int         `orm:"status" json:"status"`           // 创建时间/注册时间
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
	fmt.Println("sqllllll")
	return Model.Data(r).Where(gdb.GetWhereConditionOfStruct(r)).Update()
}

// Delete does "DELETE FROM...WHERE..." statement for deleting current object from table.
func (r *Entity) Delete() (result sql.Result, err error) {
	return Model.Where(gdb.GetWhereConditionOfStruct(r)).Delete()
}
