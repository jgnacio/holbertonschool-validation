FROM golang:1.15.8-alpine
# Update packages
RUN apk update

# Install dependecies
# hadolint ignore=DL3018
RUN apk --no-cache add curl hugo bash

# Install hadolint
RUN curl -LO https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && \
    chmod +x hadolint-Linux-x86_64 && \
    mv hadolint-Linux-x86_64 /usr/bin/hadolint

# install container structure test
RUN curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && mv container-structure-test-linux-amd64 /usr/bin/container-structure-test

# Fix DL4006 set sh shell to alpine
SHELL ["/bin/bash", "-o", "pipefail","-c"]

# Install golangcli-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s && \
    mv ./bin/golangci-lint /usr/bin/ && \
    rm -rf ./bin
