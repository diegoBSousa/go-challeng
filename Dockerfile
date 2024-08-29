FROM golang:1.19 AS builder

WORKDIR /app

COPY ./src/ .

RUN GOOS=linux CGO_ENABLED=0 go build -ldflags="-w -s" -o main main.go

FROM scratch
COPY --from=builder /app/main .
ENTRYPOINT [ "./main" ]