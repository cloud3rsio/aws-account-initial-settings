.DEFAULT_GOAL := help
STACK_NAME := AwsAccountInitialSettings

## Deploy
deploy:
	aws cloudformation deploy \
		--template-file template.yaml \
		--stack-name $(STACK_NAME) \
		--capabilities CAPABILITY_NAMED_IAM \
		--no-fail-on-empty-changeset \
		--parameter-overrides "EmailAddress=${EmailAddress}"

## Show help
help:
	@make2help $(MAKEFILE_LIST)

.PHONY: help
.SILENT:
