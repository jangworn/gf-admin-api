package receive

import (
	"fmt"
	"gf-admin-api/function/response"

	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
)

type Controller struct{}

type Client struct {
	Uid        string `json:"uid"`
	LatestTime string `json:"latestTime"`
}

func (c *Controller) GetQueueList(r *ghttp.Request) {
	client := g.DB().Table("client")
	list, err := client.Where("status=2").OrderBy("latest_time asc").All()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	response.JsonExit(r, "", list)
}

func (c *Controller) GetConversationList(r *ghttp.Request) {
	client := g.DB().Table("client")
	list, err := client.Where("status=3 or status =2").OrderBy("latest_time asc").All()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	data := make(map[string]interface{})
	var queue []interface{}
	var conversation []interface{}
	if len(list) > 0 {
		for _, v := range list {
			if status := v["status"].Int(); status == 2 {
				queue = append(queue, v)
			} else {
				conversation = append(conversation, v)
			}
		}
	}
	data["queue"] = queue
	data["conversation"] = conversation
	response.JsonExit(r, "", data)
}

func (c *Controller) GetConversationMessage(r *ghttp.Request) {
	chatRecords := g.DB().Table("chat_records")
	uid := r.Get("uid")
	var DataEncryptionKey string
	DataEncryptionKey = g.Cfg().GetString("server.DataEncryptionKey")

	list, err := chatRecords.Fields("id,sender,receiver,aes_decrypt(from_base64(content),'"+DataEncryptionKey+"') as content ,time").Where("sender=?", uid).Or("receiver=?", uid).OrderBy("id desc").Limit(10).All()
	if err != nil {
		fmt.Println("err = ", err)
		return
	}
	var data []interface{}
	for i := len(list) - 1; i >= 0; i-- {
		data = append(data, list[i])
	}

	// Reverse makes array with elements in reverse order.
	/* fmt.Println(array.Reverse().Slice())

		a := garray.NewSortedArray(func(v1, v2 interface{}) int {
	        if v1.(int) < v2.(int) {
	            return 1
	        }
	        if v1.(int) > v2.(int) {
	            return -1
	        }
	        return 0
	    }) */
	response.JsonExit(r, "", data)
}
