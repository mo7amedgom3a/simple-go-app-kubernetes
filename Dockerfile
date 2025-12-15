# Use Go 1.23 bookworm as base image
FROM golang:1.24.0-alpine AS builder

# Move to working directory /build
WORKDIR /build

# Copy the go.mod and go.sum files to the /build directory
COPY go.mod  ./
# Copy the entire source code into the container
COPY . .

# Build the application
RUN go build -o go-blog

# Document the port that may need to be published
EXPOSE 8000

# Start the application
CMD ["/build/go-blog"]
