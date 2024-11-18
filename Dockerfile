# FROM golang:bullseye

# WORKDIR /service

# RUN apt clean && apt-get update && apt-get -y install alien

# install dependencies
FROM pennsieve/pennsieve-agent:1.6.0

RUN apk update && apk upgrade

WORKDIR /service/

RUN cp /root/pennsieve /usr/local/bin/

ENV PATH="${PATH}:/usr/local/bin"


# install Go
RUN wget https://go.dev/dl/go1.22.7.linux-amd64.tar.gz

RUN  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.7.linux-amd64.tar.gz

ENV PATH="${PATH}:/usr/local/go/bin"


# cleanup
RUN rm -f go1.22.7.linux-amd64.tar.gz


# run main program files

COPY . .

RUN ls /service

RUN go build -o /service/main main.go

RUN mkdir -p data

# Add additional dependencies below ...

ENTRYPOINT [ "/service/main" ]