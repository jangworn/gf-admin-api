package user

import (
	"errors"
	"fmt"
	"gf-admin-api/app/model/user"
	"strconv"

	"github.com/gogf/gf/crypto/gmd5"

	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
)

const (
	USER_SESSION_MARK = "user_info"
)

// 注册输入参数
type CreateUserInput struct {
	Username   string `v:"required|length:6,16#账号不能为空|账号长度应当在:min到:max之间"`
	Password   string `v:"required|length:6,16#请输入确认密码|密码长度应当在:min到:max之间"`
	Password2  string `v:"required|length:6,16|same:Password#密码不能为空|密码长度应当在:min到:max之间|两次密码输入不相等"`
	Nickname   string
	CreateTime string
	Status     int
}

type UpdateUserInput struct {
	ID         int
	Username   string `v:"required|length:6,16#账号不能为空|账号长度应当在:min到:max之间"`
	Password   string `v:"length:6,16#请输入确认密码|密码长度应当在:min到:max之间"`
	Password2  string `v:"length:6,16|same:Password#密码不能为空|密码长度应当在:min到:max之间|两次密码输入不相等"`
	Nickname   string
	CreateTime string
	Status     int
}

type ListInput struct {
	Page  int
	Limit int
}

// 用户注册
func CreateUser(data *CreateUserInput) error {
	// 输入参数检查
	if e := gvalid.CheckStruct(data, nil); e != nil {
		return errors.New(e.FirstString())
	}
	// 昵称为非必需参数，默认使用账号名称
	if data.Nickname == "" {
		data.Nickname = data.Username
	}
	// 账号唯一性数据检查
	if !CheckPassport(data.Username) {
		return errors.New(fmt.Sprintf("账号 %s 已经存在", data.Username))
	}
	// 昵称唯一性数据检查
	if !CheckNickName(data.Nickname) {
		return errors.New(fmt.Sprintf("昵称 %s 已经存在", data.Nickname))
	}
	// 将输入参数赋值到数据库实体对象上
	var entity *user.Entity
	if err := gconv.Struct(data, &entity); err != nil {
		return err
	}
	// 记录账号创建/注册时间
	entity.CreateTime = gtime.Now()
	entity.Password, _ = gmd5.Encrypt(entity.Password)
	if _, err := user.Insert(entity); err != nil {
		return err
	}
	return nil
}

// 判断用户是否已经登录
func IsSignedIn(session *ghttp.Session) bool {
	return session.Contains(USER_SESSION_MARK)
}

// 用户登录，成功返回用户信息，否则返回nil; passport应当会md5值字符串
func SignIn(Username, password string, session *ghttp.Session) (kfId int, err error) {
	password, _ = gmd5.Encrypt(password)
	one, err := user.FindOne("username=? and password=?", Username, password)

	if err != nil {
		return
	}
	if one == nil {
		err = errors.New("账号或密码错误")
		return
	}

	kfId = int(one.ID)

	return
}

// 用户注销
func SignOut(session *ghttp.Session) error {
	return session.Remove(USER_SESSION_MARK)
}

// 检查账号是否符合规范(目前仅检查唯一性),存在返回false,否则true
func CheckPassport(Username string) bool {
	if i, err := user.FindCount("username", Username); err != nil {
		return false
	} else {
		return i == 0
	}
}

// 检查昵称是否符合规范(目前仅检查唯一性),存在返回false,否则true
func CheckNickName(nickname string) bool {
	if i, err := user.FindCount("nickname", nickname); err != nil {
		return false
	} else {
		return i == 0
	}
}

// 获得用户信息详情
func GetProfile(session *ghttp.Session) (u *user.Entity) {
	_ = session.GetStruct(USER_SESSION_MARK, &u)
	return
}

// 获得用户信息详情
func GetList() (list []*user.Entity) {
	list, _ = user.FindAll()
	return
}

func UpdateUser(data *UpdateUserInput) error {
	// 输入参数检查
	if e := gvalid.CheckStruct(data, nil); e != nil {
		return errors.New(e.FirstString())
	}
	// 昵称为非必需参数，默认使用账号名称
	if data.Nickname == "" {
		data.Nickname = data.Username
	}

	// 将输入参数赋值到数据库实体对象上
	var entity *user.EntityOne
	if err := gconv.Struct(data, &entity); err != nil {
		return err
	}
	fmt.Println("#########")
	fmt.Println(data)
	fmt.Println("###########")
	// 记录账号创建/注册时间

	m := gconv.Map(entity)
	delete(m, "create_time")
	if entity.Password != "" {
		m["password"], _ = gmd5.Encrypt(m["password"])
	} else {

		delete(m, "password")
	}

	if _, err := user.Update(m, "id="+strconv.Itoa(data.ID)); err != nil {
		return err
	}
	return nil
}
