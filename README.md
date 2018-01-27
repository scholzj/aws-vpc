# Amazon AWS VPC

This Terraform configuration creates:
* Amazon AWS VPC
* Internet Gateway
* Subnets in all configured availability zones and routing tables linking them to the Internet Gateway

Additionally, if variable `private_subnets` is set to true, it will create:

* NAT with Elastic IP address in each availability zone
* Private subnet in each availability zone with routing tables linking them to the NAT

This configuration uses my own module from [Terraform Module Registry](https://registry.terraform.io/modules/scholzj/vpc/aws/).

<!-- TOC -->

- [Amazon AWS VPC](#amazon-aws-vpc)
    - [Prerequisites and dependencies](#prerequisites-and-dependencies)
    - [Configuration](#configuration)
    - [Creating the VPC](#creating-the-vpc)
    - [Deleting the VPC](#deleting-the-vpc)

<!-- /TOC -->

## Prerequisites and dependencies

There are no other dependencies apart from [Terraform](https://www.terraform.io).

## Configuration

| Option | Explanation | Example |
|--------|-------------|---------|
| `aws_region` | AWS region which should be used | `eu-central-1` |
| `aws_zones` | List of AWS availability zones which should be used | `["eu-central-1a", "eu-central-1b"]` |
| `vpc_name` | Name of the VPC which should ve created | `my-vpc` |
| `vpc_cidr` | CIDR address which should be used | `10.0.0.0/16` |
| `tags` | Tags which should be applied to all resources | `{ Hello = "World" }` |
| `private_subnets` | Create also private subnets with NAT in every avaialbility zone | `false` or `true` |

## Creating the VPC

To create the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Apply Terraform configuration:
```bash
terraform init
terraform apply --var-file example.tfvars
```

## Deleting the VPC

To delete the VPC, 
* Export AWS credentials into environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
* Destroy Terraform configuration:
```bash
terraform destroy --var-file example.tfvars
```