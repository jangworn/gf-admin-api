package main

import (
	_ "gf-admin-api/router"

	socketio "gf-admin-api/app/socketio"

	"github.com/gogf/gf/frame/g"
)

func main() {
	server := socketio.Server()
	go server.Serve()
	defer server.Close()
	g.Server().EnablePProf()
	g.Server().Run()
}
