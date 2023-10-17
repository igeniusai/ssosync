FROM golang:1.21.3-alpine3.18

WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy source files
COPY cmd/ ./cmd/
COPY internal/ ./internal/
COPY main.go ./
# Build the executable
RUN CGO_ENABLED=0 GOOS=linux go build -o /ssosync

ENTRYPOINT ["/ssosync"]