LOG_FILE=awesome.log

integration-tests: ## Runs integration tests in order to test the code
	@sudo docker run --rm --volume=$(pwd):/app --workdir=/app golang:1.15.8-buster \
		go test -v -coverprofile=coverage-integrations.out

unit-tests: ## Runs unit tests in order to test the code
	@sudo docker run --rm --volume=$(pwd):/app --workdir=/app golang:1.15.8-buster \
		go test -v -short -coverprofile=coverage-units.out

lint: ## Runs a lint tool
	@golangci-lint run *.go

check: ## Runs a lint for the md and an analysis of the links
	@markdownlint 'content/**/*.md'
	@find ./content -name \*.md -print0 | xargs -0 -n1 markdown-link-check

validate: ## Validates the syntax of the index.html in the dist directory
	@python3 w3c_validator.py ./dist/index.html || true

build: lint check buildHugo buildGo ## Generate the website from markdown

buildHugo: ## Generate the website from markdown
	@hugo

buildGo: ## Generate the binary from 
	@sudo docker run --rm --volume=$(pwd):/app --workdir=/app golang:1.15.8-buster \
		go build -o awesome-api ./*.go

run: ## Run the application
	@./awesome-api >./$(LOG_FILE) 2>&1 &

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
	hugo new posts/$(POST_NAME).md
	sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md

package: ## Create a .zip file named awesome-website.zip that contain dist/ and awesome-api
	@zip awesome-website.zip dist/ awesome-api

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

