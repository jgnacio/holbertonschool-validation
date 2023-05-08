PUBLIC = dist
RM = rm -r

default: help

.PHONY: help
help:	## Show this help usage
	@fgrep -h "##" $(MAKEFILE_LIST) | grep -v fgrep | sed 's/:[[:blank:]]*##/:/'

.PHONY: clean
clean:	## Clean the entire distro folder
	@$(RM) ./${PUBLIC}/*

.PHONY: build
build:	## Build the site with hugo.
	@hugo -d $(PUBLIC)

.PHONY: post
post:	## Create a new post.
	@hugo new posts/$(POST_NAME).md
	@sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md
