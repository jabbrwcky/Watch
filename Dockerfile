FROM golang:1.10-alpine as build


RUN apk add --no-cache git
WORKDIR /go/src/github.com/weaveworks/Watch
ADD . ./
RUN go get -u github.com/golang/dep/cmd/dep
RUN dep ensure
RUN go build


FROM alpine:3.7
RUN apk add --no-cache curl
COPY --from=build /go/src/github.com/weaveworks/Watch/Watch /
ENTRYPOINT ["/Watch"]
