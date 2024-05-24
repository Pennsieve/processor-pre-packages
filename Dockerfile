FROM golang:bullseye

WORKDIR /service

RUN apt clean && apt-get update && apt-get -y install alien

# install dependencies


COPY . .

RUN ls /service

RUN go build -o /service/main main.go

RUN mkdir -p data

# Add additional dependencies below ...

ENTRYPOINT [ "/service/main" ]