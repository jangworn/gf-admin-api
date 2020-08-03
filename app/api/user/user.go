package user

import (
	"gf-admin-api/app/service/user"
	"gf-admin-api/function/response"

	"github.com/gogf/gf/net/ghttp"
)

// 用户API管理对象
type Controller struct{}

// 注册请求参数，用于前后端交互参数格式约定
type CreateUserRequest struct {
	user.CreateUserInput
}
type UpdateUserRequest struct {
	user.UpdateUserInput
}

// @summary 用户注册接口
// @tags    用户服务
// @produce json
// @param   passport  formData string  true "用户账号名称"
// @param   password  formData string  true "用户密码"
// @param   password2 formData string  true "确认密码"
// @param   nickname  formData string false "用户昵称"
// @router  /user/CreateUser [POST]
// @success 200 {object} response.JsonResponse "执行结果"
func (c *Controller) CreateUser(r *ghttp.Request) {
	var data *CreateUserRequest
	// 这里没有使用Parse而是仅用GetStruct获取对象，
	// 数据校验交给后续的service层统一处理
	if err := r.GetStruct(&data); err != nil {
		response.JsonExit(r, err.Error())
	}
	if err := user.CreateUser(&data.CreateUserInput); err != nil {
		response.JsonExit(r, err.Error())
	} else {
		response.JsonExit(r, "ok")
	}
}

// 登录请求参数，用于前后端交互参数格式约定
type SignInRequest struct {
	Username string `v:"required#账号不能为空"`
	Password string `v:"required#密码不能为空"`
}

// @summary 判断用户是否已经登录
// @tags    用户服务
// @produce json
// @router  /user/issignedin [GET]
// @success 200 {object} response.JsonResponse "执行结果:`true/false`"
func (c *Controller) IsSignedIn(r *ghttp.Request) {
	response.JsonExit(r, "", user.IsSignedIn(r.Session))
}

// 账号唯一性检测请求参数，用于前后端交互参数格式约定
type CheckPassportRequest struct {
	Username string
}

// @summary 检测用户账号接口(唯一性校验)
// @tags    用户服务
// @produce json
// @param   passport query string true "用户账号"
// @router  /user/checkpassport [GET]
// @success 200 {object} response.JsonResponse "执行结果:`true/false`"
func (c *Controller) CheckPassport(r *ghttp.Request) {
	var data *CheckPassportRequest
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r, err.Error())
	}
	if data.Username != "" && !user.CheckPassport(data.Username) {
		response.JsonExit(r, "账号已经存在", false)
	}
	response.JsonExit(r, "", true)
}

// 账号唯一性检测请求参数，用于前后端交互参数格式约定
type CheckNickNameRequest struct {
	Nickname string
}

// @summary 检测用户昵称接口(唯一性校验)
// @tags    用户服务
// @produce json
// @param   nickname query string true "用户昵称"
// @router  /user/checkpassport [GET]
// @success 200 {object} response.JsonResponse "执行结果"
func (c *Controller) CheckNickName(r *ghttp.Request) {
	var data *CheckNickNameRequest
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r, err.Error())
	}
	if data.Nickname != "" && !user.CheckNickName(data.Nickname) {
		response.JsonExit(r, "昵称已经存在", false)
	}
	response.JsonExit(r, "ok", true)
}

// @summary 获取用户详情信息
// @tags    用户服务
// @produce json
// @router  /user/profile [GET]
// @success 200 {object} user.Entity "用户信息"
func (c *Controller) Profile(r *ghttp.Request) {
	response.JsonExit(r, "", user.GetProfile(r.Session))
}

/**
 * @summary:
 * @tags:
 * @produce: json
 * @param {type}
 * @router: /user/profile [GET]
 * @return:
 */
func (c *Controller) List(r *ghttp.Request) {
	//page := r.Get("page")
	//limit := r.Get("limit")
	response.JsonExit(r, "", user.GetList())
}

/**
 * @summary: 更新用户信息
 * @tags: 用户
 * @produce: json
 * @param {type}
 * @router: /user/checktoken [GET]
 * @return:
 */
func (c *Controller) CheckToken(r *ghttp.Request) {
	//token := r.Get("token")
	response.JsonExit(r, "", "123")
}

/**
 * @summary: 更新用户信息
 * @tags: 用户
 * @produce: json
 * @param {type}
 * @router: /user/update [POST]
 * @return:
 */
func (c *Controller) Update(r *ghttp.Request) {
	var data *UpdateUserRequest

	// 这里没有使用Parse而是仅用GetStruct获取对象，
	// 数据校验交给后续的service层统一处理
	if err := r.Parse(&data); err != nil {
		response.JsonExit(r, err.Error())
	}
	if err := user.UpdateUser(&data.UpdateUserInput); err != nil {
		response.JsonExit(r, err.Error())
	} else {
		response.JsonExit(r, "ok")
	}
}
