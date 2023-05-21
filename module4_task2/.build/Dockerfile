FROM golang:1.15.8-alpine
# Update packages
RUN apk update

# Install dependecies
# hadolint ignore=DL3018
RUN apk --no-cache add curl hugo

# Install hadolint, container structure test and golangcli-lint
RUN curl -LO  /usr/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x /usr/bin/hadolint &&\
    curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && mv container-structure-test-linux-amd64 /usr/bin/container-structure-test

# Fix DL3018
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install golangcli-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s
RUN mv ./bin/golangci-lint /usr/bin/ &&\
    rm -rf ./bin
