FROM golang:1.20-alpine AS builder

WORKDIR /app

RUN apk add --no-cache gcc musl-dev git

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN GOARCH=amd64 GOOS=linux go build -o main .

FROM alpine:3.14

WORKDIR /app

COPY --from=builder /app/main /app/

EXPOSE 8080

CMD ["./main"]
