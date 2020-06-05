FROM golang:1.13-alpine AS builder
ENV GO111MODULE=on
WORKDIR /go/src/app
COPY . .
RUN go get ./...
RUN GOOS=linux GOARCH=amd64 go build main.go
FROM golang:1.13-alpine
COPY --from=builder /go/src/app/main /go/bin

ENTRYPOINT ["/go/bin/main"]
