package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"time"

	"gf-admin-api/grpc/discovery/resolver"
	pb "gf-admin-api/grpc/proto"

	"google.golang.org/grpc"
	"google.golang.org/grpc/balancer/roundrobin"
)

const (
	address     = "localhost:8500"
	defaultName = "world"
	serviceName = "Greeter"
)

func main() {
	// Set up a connection to the server.
	schema, err := resolver.GenerateAndRegisterConsulResolver(address, serviceName)
	if err != nil {
		log.Fatal("init consul resovler err", err.Error())
	}
	//conn, err := grpc.Dial(address, grpc.WithInsecure(), grpc.WithBlock())
	conn, err := grpc.Dial(fmt.Sprintf("%s:///"+serviceName, schema), grpc.WithInsecure(), grpc.WithBalancerName(roundrobin.Name))
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewGreeterClient(conn)

	// Contact the server and print out its response.
	name := defaultName
	if len(os.Args) > 1 {
		name = os.Args[1]
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()
	r, err := c.SayHello(ctx, &pb.HelloRequest{Name: name})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Printf("Greeting: %s", r.GetMessage())

	r2, err := c.SayHelloAgain(ctx, &pb.HelloRequest{Name: name})
	if err != nil {
		log.Fatalf("could not greet2: %v", err)
	}
	log.Printf("Greeting2: %s", r2.GetMessage())
}
