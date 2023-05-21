FROM golang:1.15.8-alpine
# Update packages
RUN apk update

# Install dependecies
RUN apk add wget curl

# Install hugo
RUN mkdir -p /app/hugo_bin
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz -P /app/hugo_bin/
RUN tar -xf /app/hugo_bin/hugo_extended_0.84.0_Linux-64bit.tar.gz -C /app/hugo_bin/
RUN mv /app/hugo_bin/hugo /bin/
RUN rm -rf /app/hugo_bin

# Install hadolint
RUN wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
RUN chmod +x /bin/hadolint

# Install golangcli-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s
RUN mv ./bin/golangci-lint /bin/
RUN rm -rf ./bin
