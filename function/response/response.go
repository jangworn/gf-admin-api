package response

import (
	"github.com/gogf/gf/net/ghttp"
)

// 数据返回通用JSON数据结构
type JsonResponse struct {
	Code    int         `json:"code"`    // 错误码((200:成功, 400:失败))
	Message string      `json:"message"` // 提示信息
	Data    interface{} `json:"data"`    // 返回数据(业务接口定义具体数据结构)
}

// 标准返回结果数据结构封装。
func Json(r *ghttp.Request, message string, data ...interface{}) {

	responseData := interface{}(nil)
	var code int
	if len(data) > 0 {
		responseData = data[0]
		code = 200
	} else {
		code = 400
	}
	r.Response.WriteJson(JsonResponse{
		Code:    code,
		Message: message,
		Data:    responseData,
	})
}

// 返回JSON数据并退出当前HTTP执行函数。
func JsonExit(r *ghttp.Request, message string, data ...interface{}) {
	Json(r, message, data...)
	r.Exit()
}
