package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"strconv"
	"time"

	pb "gf-admin-api/grpc/proto"

	"gf-admin-api/grpc/discovery"
	"gf-admin-api/grpc/discovery/register"

	"google.golang.org/grpc"
)

const (
	port       = 50052
	host       = "localhost"
	consulPort = 8500
)

// server is used to implement helloworld.GreeterServer.
type server struct {
	pb.UnimplementedGreeterServer
}

// SayHello implements helloworld.GreeterServer
func (s *server) SayHello(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received: %v", in.GetName())
	return &pb.HelloReply{Message: "Hello " + in.GetName()}, nil
}

func (s *server) SayHelloAgain(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received2: %v", in.GetName())
	return &pb.HelloReply{Message: "Hello2 " + in.GetName()}, nil
}

func main() {
	lis, err := net.Listen("tcp", ":"+strconv.Itoa(port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	cr := register.NewConsulRegister(fmt.Sprintf("%s:%d", host, consulPort), 15)
	cr.Register(discovery.RegisterInfo{
		Host:           host,
		Port:           port,
		ServiceName:    "Greeter",
		UpdateInterval: time.Second})

	pb.RegisterGreeterServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
