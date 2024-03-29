## gf-admin-api

一个前后端分离管理后台，前端Vue.js 、后端GoFrame

### web
[gf-admin-web](https://github.com/jangworn/gf-admin-web)  
[简易聊天室chat-room](https://github.com/jangworn/chat-room)  [在线demo](http://johnyn.com:8080/chat-room) 


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


### 运行http server
go run main.go

### docker-compose 部署
1. CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main main.go
2. docker-compose build --no-cache
3. docker-compose up -d

### jenkins持续部署
```
# 服务部署采用docker部署方式，jenkins就不能用docker安装,以ubuntu为例
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

# 编辑/etc/default/jenkins，修改web端口
# 启动jenkins
service jenkins start
# 浏览器访问http://localhost:8080,系统管理->插件管理->安装Go Plugin
# 系统管理->全局工具配置->点击Go安装按钮->设置别名和ubuntu的GOROOT对应目录
# 新建任务->选择构建自由风格软件项目->general配置github仓库地址->源码管理配置github仓库、credentials、分支->构建环境Set up Go programming language tools->构建shell输入框填入上面docker-compose的3行命令->保存
```


### grpc proto
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


```

分布式部署grpc微服务
```
docker pull consul
# 启动leader server
docker run -d -p 8500:8500  --name=consul_server_1 consul agent -server -bootstrap -ui -node=1 -client='0.0.0.0'
# 查看leader ip
docker inspect -f '{{ .NetworkSettings.IPAddress }}' consul_server_1
# 启动server2 server3 并加入到leader
docker run -d -p 8500:8500  --name=consul_server_2 consul agent -server -node=2 -join='172.17.0.2'
docker run -d -p 8500:8500  --name=consul_server_3 consul agent -server -node=3 -join='172.17.0.2'
# 启动client1 client2 client3
docker run -d  --name=consul_client_1 consul agent -client -node=4 -join='172.17.0.2' -client='0.0.0.0'
docker run -d  --name=consul_client_2 consul agent -client -node=5 -join='172.17.0.2' -client='0.0.0.0'
docker run -d  --name=consul_client_3 consul agent -client -node=6 -join='172.17.0.2' -client='0.0.0.0'
# 查看leader server members
docker exec consul_server_1 consul members

cd grpc
go run server/main.go
go run client/main.go
```
