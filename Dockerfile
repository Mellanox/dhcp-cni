FROM golang as builder

# Add DHCP CNI src
RUN GOPATH=/go go get github.com/containernetworking/plugins/plugins/ipam/dhcp
WORKDIR /go/src/github.com/containernetworking/plugins/plugins/ipam/dhcp
RUN GOPATH=/go CGO_ENABLED=0 go build

FROM busybox
COPY --from=builder /go/src/github.com/containernetworking/plugins/plugins/ipam/dhcp/dhcp /
WORKDIR /
LABEL io.k8s.display-name="DHCP CNI"
VOLUME ["/run"]
USER root
CMD ["/dhcp", "daemon"]

