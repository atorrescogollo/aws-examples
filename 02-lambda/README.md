# Lambda
Simple Python Lambda deployment with triggers (cloudwatch events) and destinations (SNS via mail)

## Deployment
```bash
git clone https://github.com/atorrescogollo/aws-examples.git
cd aws-examples/02-lambda/
cp config.yaml.sample config.yaml
vim config.yaml # Edit as you consider

cd env/dev
terragrunt apply
```
