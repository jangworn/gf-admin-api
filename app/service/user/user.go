package user

import (
	"errors"
	"fmt"
	"gf-admin-api/app/dao"
	"gf-admin-api/app/model"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/gvalid"
	"strconv"
)

const (
	USER_SESSION_MARK = "user_info"
)

type ListInput struct {
	Page  int
	Limit int
}

// 用户注册
func CreateUser(data *model.CreateUserReq) error {
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

	// 记录账号创建/注册时间
	data.CreateTime = gtime.Now().String()
	data.Password, _ = gmd5.Encrypt(data.Password)
	if _, err := dao.User.Save(data); err != nil {
		return err
	}
	return nil
}

// 判断用户是否已经登录
func IsSignedIn(session *ghttp.Session) bool {
	return session.Contains(USER_SESSION_MARK)
}

// 用户登录，成功返回用户信息，否则返回nil; passport应当为md5值字符串
func SignIn(Username, password string, session *ghttp.Session) (kfId int, err error) {
	password, _ = gmd5.Encrypt(password)
	user, err := dao.User.FindOne("username=? and password=?", Username, password)

	if err != nil {
		return
	}
	if user == nil {
		err = errors.New("账号或密码错误")
		return
	}
	kfId = int(user.Id)

	return
}

// 用户注销
func SignOut(session *ghttp.Session) error {
	return session.Remove(USER_SESSION_MARK)
}

// 检查账号是否符合规范(目前仅检查唯一性),存在返回false,否则true
func CheckPassport(Username string) bool {
	if i, err := dao.User.FindCount("username", Username); err != nil {
		return false
	} else {
		return i == 0
	}
}

// 检查昵称是否符合规范(目前仅检查唯一性),存在返回false,否则true
func CheckNickName(nickname string) bool {
	if i, err := dao.User.FindCount("nickname", nickname); err != nil {
		return false
	} else {
		return i == 0
	}
}

// 获得用户信息详情
func GetProfile(session *ghttp.Session) (u *model.User) {
	_ = session.GetStruct(USER_SESSION_MARK, &u)
	return
}

// 获得用户列表
func GetList() (list []*model.User) {
	list, _ = dao.User.FindAll()
	return
}

func UpdateUser(data *model.UpdateUserReq) error {
	// 输入参数检查
	if e := gvalid.CheckStruct(data, nil); e != nil {
		return errors.New(e.FirstString())
	}
	// 昵称为非必需参数，默认使用账号名称
	if data.Nickname == "" {
		data.Nickname = data.Username
	}

	// 记录账号创建/注册时间
	m := gconv.Map(data)
	m["UpdateTime"] = gtime.Now().String()
	delete(m, "Id")
	if data.Password != "" {
		m["Password"], _ = gmd5.Encrypt(m["Password"])
	} else {
		delete(m, "Password")
	}
	fmt.Println("pwd:",m)
	if _, err := dao.User.Update(m, "id="+strconv.Itoa(data.Id)); err != nil {
		return err
	}
	return nil
}
//客服接待：排队中的用户
func  QueueList() (list []*model.Client,err error){
	list, err = dao.Client.Where("status=2").Order("latest_time asc").All()
	return
}

func ConversationList()(data map[string]interface{},err error) {
	list, err := dao.Client.Where("status=3 or status =2").Order("latest_time asc").All()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	data = make(map[string]interface{})
	var queue []interface{}
	var conversation []interface{}
	if len(list) > 0 {
		for _, v := range list {
			fmt.Println(v.Status)
			if status := v.Status; status == 2 {
				queue = append(queue, v)
			} else {
				conversation = append(conversation, v)
			}
		}
	}

	data["queue"] = queue
	data["conversation"] = conversation
	return
}