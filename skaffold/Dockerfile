FROM golang:1.13-alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN GOOS=linux GOARCH=amd64 go build main.go
FROM golang:1.13-alpine
# Define GOTRACEBACK to mark this container as using the Go language runtime
# for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
ENV GOTRACEBACK=single
COPY --from=builder /go/src/app/main /go/bin
ENTRYPOINT ["/go/bin/main"]
