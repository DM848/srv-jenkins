FROM golang:1.11.2 as builder

WORKDIR /app
COPY . /app

RUN go test ./...
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o webserver .

FROM dm848/consul-service

WORKDIR /server
COPY --from=builder /app/webserver .

# COPY ContainerPilot configuration
COPY containerpilot.json5 /etc/containerpilot.json5
ENV CONTAINERPILOT=/etc/containerpilot.json5

ENV WEB_SERVER_PORT 8080
EXPOSE 8080
CMD ["/bin/containerpilot"]
