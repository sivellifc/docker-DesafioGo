FROM golang:1.17 as build

WORKDIR /go/src/app
COPY . .

RUN go mod init hello

RUN go build

FROM scratch
COPY --from=build /go/src/app/hello /
CMD ["/hello"]
