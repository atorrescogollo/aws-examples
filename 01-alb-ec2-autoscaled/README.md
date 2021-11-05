# ELB with autoscaled EC2 instances
Application Load Balancing between different EC2 autoscaled with AWS Auto Scaling

## Deployment
```bash
git clone https://github.com/atorrescogollo/aws-examples.git
cd aws-examples/01-alb-ec2-autoscaled/
cp config.yaml.sample config.yaml
vim config.yaml # Edit as you consider

cd env/dev
terragrunt apply
```
