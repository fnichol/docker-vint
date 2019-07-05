VERSION := $(shell cat VERSION.txt)
BUMP_VERSION_SOURCES ?= README.md

bump-version: ## Set a new version for the project. Set VERSION=x.y.z
	@echo "--- $@"
	@if [ -z "$(strip $(VERSION))" ]; then \
		echo "xxx usage: make bump-version VERSION=1.2.3" >&2; \
		echo "xxx Missing required value: VERSION" >&2; \
		exit 1; \
	fi
	@echo "  - Updating: [$(BUMP_VERSION_SOURCES)]"
	current="$$(cat VERSION.txt | sed 's,\.,\\.,g')" \
		&& sed -i.bump_version_backup "s,$${current},$(VERSION),g" \
			$(BUMP_VERSION_SOURCES) \
		&& find . -type f -name '*.bump_version_backup' | xargs rm -f
	@echo "  - Setting version to '$(VERSION)' in VERSION.txt"
	echo "$(VERSION)" > VERSION.txt
	@echo "  - Preparing release commit"
	git add $(BUMP_VERSION_SOURCES)
	git commit --signoff --message "[release] Update version to $(VERSION)"
	@echo
	@echo "To complete the release for $(VERSION), run: \`make tag\`"
.PHONY: bump-version

tag: ## Create a new release Git tag
	@echo "--- $@"
	@version="$$(cat VERSION.txt)" && tag="v$$version" \
		&& git tag --annotate "$$tag" \
			--message "Release version $$version" \
		&& echo "Release tag '$$tag' created." \
		&& echo "To push: \`git push origin $$tag\`"
.PHONY: tag
