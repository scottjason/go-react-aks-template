# Stage 1: Build
FROM golang:1.18-alpine AS builder
WORKDIR /app

# Install necessary packages for building Go
RUN apk add --no-cache gcc musl-dev git

# Copy the Go modules files
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application for Linux architecture
RUN GOARCH=amd64 GOOS=linux go build -o main .

# Stage 2: Production
FROM alpine:3.14
WORKDIR /app

# Copy the built Go binary from the builder stage
COPY --from=builder /app/main /app/

# Expose the necessary port
EXPOSE 8080

# Command to run the Go application
CMD ["./main"]
