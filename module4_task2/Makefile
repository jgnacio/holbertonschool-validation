LOG_FILE=awesome.log
DOCKER_IMAGE=awesome:build

build-docker: ## builds docker image
	@docker build -t $(DOCKER_IMAGE) .build/.

docker-tests: ## tests docker image
	@docker run --rm --volume=/var/run/docker.sock:/var/run/docker.sock --volume=$(shell pwd):/app \
	--workdir=/app ${DOCKER_IMAGE} \
	container-structure-test test -q --image ${DOCKER_IMAGE} \
	--config .build/cst.yml && echo OK

integration-tests: ## Runs integration tests in order to test the code
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app ${DOCKER_IMAGE} \
		go test -v -coverprofile=coverage-integrations.out

unit-tests: ## Runs unit tests in order to test the code
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app ${DOCKER_IMAGE}  \
		go test -v -short -coverprofile=coverage-units.out

lint: ## Run all lint checks
	@hadolint .build/Dockerfile && echo OK

check: ## Runs a lint for the md and an analysis of the links
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app ${DOCKER_IMAGE}  \
		echo "Check dump"

validate: ## Validates the syntax of the index.html in the dist directory
	@python3 w3c_validator.py ./dist/index.html || true

build: lint check buildHugo buildGo ## Generate the website from markdown

buildHugo: ## Generate the website from markdown
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app ${DOCKER_IMAGE}  \
		hugo

buildGo: ## Generate the binary from 
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app ${DOCKER_IMAGE}  \
		go build -o awesome-api ./*.go

run: ## Run the application
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app golang:1.15.8-buster \
		./awesome-api >./$(LOG_FILE) 2>&1 &

stop: ## Stop the app
	@pkill awesome-api || true

clean: stop ## Cleanup the content of the 'dist/' folder
	@rm -rf dist/ || true
	@rm -f awesome-api awesome.log || true
	@rm -f coverage-units.out coverage-integrations.out || true
	@rm -f awesome-website.zip || true

test: unit-tests integration-tests ## Tests the application
	@echo "Test"

post: ## Create a new blog post using POST_TITLE and POST_NAME env variables
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app golang:1.15.8-buster \
		hugo new posts/$(POST_NAME).md && \
		sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md

package: ## Create a .zip file named awesome-website.zip that contain dist/ and awesome-api
	@zip awesome-website.zip dist/ awesome-api

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
