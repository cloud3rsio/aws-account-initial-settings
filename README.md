# Aws account initial settings

Initialize the aws account.

- Cloudtrail
- GuardDuty

## Usage

`template.yaml` is Cloudformation template file.  
Please execute Cloudformation.  
  
If you use aws-cli, you can use `make` command.

```
$ make
deploy:            Deploy
help:              Show help

$ EmailAddress='notice@example.com' make deploy
```
