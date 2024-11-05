FROM golang:latest AS BUILD

WORKDIR /app

COPY ./ ./

RUN go mod download

RUN go build -o /webapp

FROM gcr.io/distroless/base-debian11 AS FINAL

WORKDIR /

COPY --from=BUILD /webapp /webapp

EXPOSE 8080

CMD ["/webapp"]


