EXE_NAME = awesome-api
SRC = main.go
RM = rm -r


default: help

help:	## Show this help usage
	@fgrep -h "##" $(MAKEFILE_LIST) | grep -v fgrep | sed 's/:[[:blank:]]*##/:/'

build: $(SRC)	## Build the main.go file with go.
ifeq (,$(wildcard ./go.mod))
	@go mod init github.com/jgnacio/$(EXE_NAME)
	@go mod tidy
endif
	@go build -o $(EXE_NAME)

run: $(EXE_NAME)
	@./awesome-api > ./awesome-api.log 2>&1 &

.PHONY : stop clean
stop:
	@kill $(shell pgrep awesome-api)

clean: | stop
	@rm -f awesome-api awesome-api.log

test:
	@curl http://localhost:9999/health ; echo "" ; curl http://localhost:9999
