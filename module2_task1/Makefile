EXE_NAME = awesome-api
SRC = main.go
LINT = golangci-lint
RM = rm -r


default: help

help:	## Show this help usage
	@fgrep -h "##" $(MAKEFILE_LIST) | grep -v fgrep | sed 's/:[[:blank:]]*##/:/'

build: | lint $(SRC)	## Build the main.go file with go.
ifeq (,$(wildcard ./go.mod))
	@go mod init github.com/jgnacio/$(EXE_NAME)
	@go mod tidy
endif
	@go build -o $(EXE_NAME)

run: $(EXE_NAME)	## Run the web server and run in the background
	@./$(EXE_NAME) > ./$(EXE_NAME).log 2>&1 &

stop:	## Kill process
	@kill $(shell pgrep $(EXE_NAME))

clean: | stop	## Do stop and remove the binary and logs
	@rm -f $(EXE_NAME) $(EXE_NAME).log

test:	## Testing the port 9999 awesome api with curl
	@curl http://localhost:9999/health ; echo "" ; curl http://localhost:9999

lint:	## Run golang-lint for all go files in the proyect.
	@$(LINT) run
