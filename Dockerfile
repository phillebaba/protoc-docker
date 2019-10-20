FROM golang

RUN go get -u github.com/golang/protobuf/protoc-gen-go

FROM ubuntu

COPY --from=0 /go/bin/protoc-gen-go /usr/local/bin

RUN apt update && apt install -y wget unzip curl

RUN cd /tmp && wget https://github.com/protocolbuffers/protobuf/releases/download/v3.10.0/protoc-3.10.0-linux-x86_64.zip && \
    unzip -o protoc-3.10.0-linux-x86_64.zip -d /usr/local bin/protoc && \
    unzip -o protoc-3.10.0-linux-x86_64.zip -d /usr/local 'include/*'

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt install -y nodejs
RUN npm -g install ts-protoc-gen

RUN mkdir -p /protobuf

ENTRYPOINT ["/usr/local/bin/protoc", "-I/protobuf", "--plugin=protoc-gen-ts=/usr/lib/node_modules/ts-protoc-gen/bin/protoc-gen-ts"]
