# Aws account initial settings

Initialize the aws account.

- Cloudtrail

## Usage

`cloudformation.yaml` is Cloudformation template file.  
Please execute Cloudformation.  
  
If you use aws-cli, you can use `make` command.

```
$ make
create-change-set:   Create Change-Set
create-stack:        Create Stack
delete-stack:        Delete Stack
describe-change-set: Describe Change-set
describe-stacks:     Describe Stacks
execute-change-set:  Execute Change-set
help:                Show help
update-stack:        Update Stack
validate:            Validate

$ make create-stack
```
