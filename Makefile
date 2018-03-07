.DEFAULT_GOAL := help
TEMPLATE_FILE_CFN := cloudformation.yaml
STACK_NAME := AwsAccountInitialSettings

## Validate
validate:
	aws cloudformation validate-template --template-body file://$(TEMPLATE_FILE_CFN)

## Create Stack
create-stack:
	aws cloudformation create-stack --template-body file://$(TEMPLATE_FILE_CFN) \
	   	--stack-name $(STACK_NAME) \
		--capabilities CAPABILITY_NAMED_IAM

## Describe Stacks
describe-stacks:
	aws cloudformation describe-stacks --stack-name $(STACK_NAME)

## Create Change-Set
create-change-set:
	aws cloudformation create-change-set --stack-name $(STACK_NAME) \
		--template-body file://$(TEMPLATE_FILE_CFN) \
		--capabilities CAPABILITY_NAMED_IAM \
		--change-set-name "change-set-name-`date '+%Y%m%d%H%M%S'`"

## Describe Change-set
describe-change-set:
	aws cloudformation describe-change-set \
		--change-set-name `aws cloudformation list-change-sets --stack-name $(STACK_NAME) | jq -r '.Summaries[0].ChangeSetId'`

## Execute Change-set
execute-change-set:
	aws cloudformation execute-change-set \
		--change-set-name `aws cloudformation list-change-sets --stack-name $(STACK_NAME) | jq -r '.Summaries[0].ChangeSetId'`

## Update Stack
update-stack:
	aws cloudformation create-change-set --stack-name $(STACK_NAME) \
		--template-body file://$(TEMPLATE_FILE_CFN) \
		--capabilities CAPABILITY_NAMED_IAM \
		--change-set-name "change-set-name-`date '+%Y%m%d%H%M%S'`"
	sleep 3
	aws cloudformation execute-change-set \
		--change-set-name `aws cloudformation list-change-sets --stack-name $(STACK_NAME) | jq -r '.Summaries[0].ChangeSetId'`

## Delete Stack
delete-stack:
	aws cloudformation delete-stack --stack-name $(STACK_NAME)

## Show help
help:
	@make2help $(MAKEFILE_LIST)

.PHONY: help validate create-stack describe-stacks create-change-set describe-change-set execute-change-set delete-stack
