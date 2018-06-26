FROM golang:1.10.3-stretch

ENV GOPATH=/gannoy/
ENV DIM=512
ENV K=1024
WORKDIR /gannoy/src/
RUN go get github.com/monochromegane/gannoy/ && \
    go get github.com/jessevdk/go-flags && \
    go get github.com/labstack/echo && \
    go get github.com/labstack/echo/middleware && \
    go get github.com/labstack/gommon/log && \
    go get github.com/lestrrat/go-server-starter/listener && \
    go get github.com/monochromegane/conflag && \
    go get github.com/nightlyone/lockfile && \
    go get golang.org/x/net/netutil
RUN go build -o /usr/local/bin/gannoy-db github.com/monochromegane/gannoy/cmd/gannoy-db/main.go
RUN go build -o /usr/local/bin/gannoy github.com/monochromegane/gannoy/cmd/gannoy/main.go
RUN mkdir /data
RUN gannoy create -d $DIM -K $K -p /data table
CMD gannoy-db -d /data