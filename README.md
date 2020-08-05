## gf-admin-api

一个前后端分离管理后台，前端Vue.js 、后端GoFrame

### web
[gf-admin-web](https://github.com/jangworn/gf-admin-web)


#### golang环境搭建
```
golang版本 >= 1.11

# 下载
wget https://studygolang.com/dl/golang/go1.14.6.linux-amd64.tar.gz

# 解压
sudo tar -C /usr/local -zxvf go1.14.6.linux-amd64.tar.gz

vi ~/.profile
# 添加如下内容
export GOPATH=/home/gopath
# 在PATH后添加/usr/local/go/bin
export PATH=.../usr/local/go/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

source ~/.profile
# 查看是否安装成功
go env

```


#### 运行http server
go run main.go

#### 运行socket server
go run socket-server.go

