package client

import (
	"gf-admin-api/app/service/client"
	"gf-admin-api/function/response"

	"github.com/gogf/gf/net/ghttp"
)

// 用户API管理对象
type Controller struct{}


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
	response.JsonExit(r, "", client.GetList())
}
