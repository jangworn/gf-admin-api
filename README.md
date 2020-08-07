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
# 环境变量
export PATH="$PATH:/usr/local/go/bin"

vi ~/.profile
# 添加如下内容
export GOPATH=/home/gopath
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


#### grpc proto
```
# ubuntu
PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO $PB_REL/download/v3.12.1/protoc-3.12.1-linux-x86_64.zip
unzip protoc-3.12.1-linux-x86_64.zip -d $HOME/.local
export PATH="$PATH:$HOME/.local/bin"  

# windows
wget https://github.com/protocolbuffers/protobuf/releases/download/v4.0.0-rc2/protoc-4.0.0-rc-2-win64.zip
配置环境变量

# 查看版本
protoc --version 

# 安装protoc-gen-go-grpc
git clone -b v1.31.0 https://github.com/grpc/grpc-go
cd grpc-go/cmd/protoc-gen-go-grpc && go install . 




 cd grpc && protoc \
  --go_out=. \
  --go-grpc_out=. \
  --go_opt=paths=source_relative \
  --go-grpc_opt=paths=source_relative \
  ./proto/grpc.proto

  go run server/main.go

  go run client/main.go
```
