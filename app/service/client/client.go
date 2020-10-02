package client

import (
	"gf-admin-api/app/model/client"
)



type ListInput struct {
	Page  int
	Limit int
}

// 获得用户信息详情
func GetList() (list []*client.Entity) {
	list, _ = client.FindAll()
	return
}

