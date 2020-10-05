package router

import (
	"gf-admin-api/app/api/client"
	"gf-admin-api/app/api/receive"
	"gf-admin-api/app/api/user"
	"gf-admin-api/app/service/middleware"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

func init() {
	s := g.Server()
	s.BindMiddlewareDefault(middleware.CORS)
	s.BindHandler("OPTIONS/POST:/signIn", middleware.GfJWTMiddleware.LoginHandler)
	s.Group("/", func(g *ghttp.RouterGroup) {
		ctlUser := new(user.Controller)
		ctlReceive := new(receive.Controller)
		ctlClient := new(client.Controller)
		g.ALL("/client", ctlClient)
		g.Middleware(middleware.Auth)
		g.ALL("/refreshToken", middleware.GfJWTMiddleware.RefreshHandler)
		g.ALL("/user", ctlUser)
		g.ALL("/receive", ctlReceive)

	})
}
