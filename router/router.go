package router

import (
	"gf-admin-api/app/api"
	"gf-admin-api/app/service/middleware"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func init() {
	s := g.Server()
	s.BindMiddlewareDefault(middleware.CORS)
	s.BindHandler("OPTIONS/POST:/signIn", middleware.GfJWTMiddleware.LoginHandler)
	s.Group("/", func(group *ghttp.RouterGroup) {
		group.ALL("/user", api.User)
		group.Middleware(middleware.Auth)
		group.ALLMap(g.Map{
			"/refreshToken":middleware.GfJWTMiddleware.RefreshHandler,
			"/admin":api.AdminUser,
			"/receive": api.Receiver,
		})
	})
}
