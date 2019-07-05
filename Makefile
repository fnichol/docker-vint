DOCKERFILE_SOURCES := $(shell find . -type f -name 'Dockerfile*'  -o -name 'Dockerfile.*' -not -path './tmp/*' -and -not -path './vendor/*')
CHECK_TOOLS += hadolint

IMAGE := $${IMAGE_NAME:-fnichol/vint}

include vendor/mk/base.mk
include vendor/mk/shell.mk
include vendor/mk/release.mk

build: ## Builds Docker image
	@echo "--- $@"
	./build.sh $(IMAGE) $(VERSION) latest
.PHONY: build

clean:
.PHONY: clean

check: check-shell hadolint ## Checks all linting, styling, & other rules
.PHONY: check

hadolint: ## Checks Dockerfiles for linting rules
	@echo "--- $@"
	hadolint $(DOCKERFILE_SOURCES)
.PHONY: hadolint

test:
.PHONY: test

update-toc: ## Update README.md table of contents
	markdown-toc -i README.md
.PHONY: update-toc
