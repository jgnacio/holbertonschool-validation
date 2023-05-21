FROM golang:1.15.8-alpine
# Update packages
RUN apk update

# Install dependecies
RUN apk add wget curl grep hugo

# Install hadolint
RUN wget -O /usr/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
RUN chmod +x /usr/bin/hadolint

# install container structure test
RUN curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && mv container-structure-test-linux-amd64 /usr/bin/container-structure-test

# Install golangcli-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s
RUN mv ./bin/golangci-lint /usr/bin/
RUN rm -rf ./bin
