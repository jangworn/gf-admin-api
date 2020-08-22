package resolver

import (
	"context"
	"fmt"
	"log"
	"sync"
	"time"

	consulapi "github.com/hashicorp/consul/api"
	"google.golang.org/grpc/resolver"
	"google.golang.org/grpc/serviceconfig"
)

type consulBuilder struct {
	address     string
	client      *consulapi.Client
	serviceName string
}

func NewConsulBuilder(address string) resolver.Builder {
	config := consulapi.DefaultConfig()
	config.Address = address
	client, err := consulapi.NewClient(config)
	if err != nil {
		log.Fatal("LearnGrpc: create consul client error", err.Error())
		return nil
	}
	return &consulBuilder{address: address, client: client}
}

func (cb *consulBuilder) Build(target resolver.Target, cc resolver.ClientConn, opts resolver.BuildOptions) (resolver.Resolver, error) {
	cb.serviceName = target.Endpoint

	adds, serviceConfig, err := cb.resolve()
	if err != nil {
		return nil, err
	}
	cc.NewAddress(adds)
	cc.NewServiceConfig(serviceConfig)

	consulResolver := NewConsulResolver(&cc, cb, opts)
	consulResolver.wg.Add(1)
	go consulResolver.watcher()

	return consulResolver, nil
}

func (cb consulBuilder) resolve() ([]resolver.Address, string, error) {

	serviceEntries, _, err := cb.client.Health().Service(cb.serviceName, "", true, &consulapi.QueryOptions{})
	if err != nil {
		return nil, "", err
	}

	adds := make([]resolver.Address, 0)
	for _, serviceEntry := range serviceEntries {
		address := resolver.Address{Addr: fmt.Sprintf("%s:%d", serviceEntry.Service.Address, serviceEntry.Service.Port)}
		adds = append(adds, address)
	}
	return adds, "", nil
}

func (cb *consulBuilder) Scheme() string {
	return "consul"
}

type consulResolver struct {
	clientConn           *resolver.ClientConn
	consulBuilder        *consulBuilder
	t                    *time.Ticker
	wg                   sync.WaitGroup
	rn                   chan struct{}
	ctx                  context.Context
	cancel               context.CancelFunc
	disableServiceConfig bool
}

func NewConsulResolver(cc *resolver.ClientConn, cb *consulBuilder, opts resolver.BuildOptions) *consulResolver {
	ctx, cancel := context.WithCancel(context.Background())
	return &consulResolver{
		clientConn:           cc,
		consulBuilder:        cb,
		t:                    time.NewTicker(time.Second),
		ctx:                  ctx,
		cancel:               cancel,
		disableServiceConfig: opts.DisableServiceConfig}
}

func (cr *consulResolver) watcher() {
	cr.wg.Done()
	for {
		select {
		case <-cr.ctx.Done():
			return
		case <-cr.rn:
		case <-cr.t.C:
		}
		adds, serviceConfig, err := cr.consulBuilder.resolve()
		if err != nil {
			log.Fatal("query service entries error:", err.Error())
		}
		(*cr.clientConn).NewAddress(adds)
		(*cr.clientConn).NewServiceConfig(serviceConfig)
	}
}

func (cr *consulResolver) Scheme() string {
	return cr.consulBuilder.Scheme()
}

func (cr *consulResolver) ResolveNow(rno resolver.ResolveNowOptions) {
	select {
	case cr.rn <- struct{}{}:
	default:
	}
}

func (cr *consulResolver) Close() {
	cr.cancel()
	cr.wg.Wait()
	cr.t.Stop()
}

type consulClientConn struct {
	adds []resolver.Address
	sc   string
	scj  string
}

func NewConsulClientConn() resolver.ClientConn {
	return &consulClientConn{}
}

func (cc *consulClientConn) NewAddress(addresses []resolver.Address) {
	cc.adds = addresses
}

func (cc *consulClientConn) NewServiceConfig(serviceConfig string) {
	cc.sc = serviceConfig
}

func (cc *consulClientConn) ReportError(error) {

}

func (cc *consulClientConn) UpdateState(resolver.State) {

}

func (cc *consulClientConn) ParseServiceConfig(serviceConfig string) *serviceconfig.ParseResult {
	//if len(serviceConfig) == 0 {
	return &serviceconfig.ParseResult{Err: fmt.Errorf("no JSON service config provided")}
	//}
}

func GenerateAndRegisterConsulResolver(address string, serviceName string) (schema string, err error) {
	builder := NewConsulBuilder(address)
	target := resolver.Target{Scheme: builder.Scheme(), Endpoint: serviceName}
	_, err = builder.Build(target, NewConsulClientConn(), resolver.BuildOptions{})
	if err != nil {
		return builder.Scheme(), err
	}
	resolver.Register(builder)
	schema = builder.Scheme()
	return
}
