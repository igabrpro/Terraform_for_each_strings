# Terraform_for_each_strings

This repo contains code taht creates two VPCs using for_each with string 

More info reguarding for_each use [here](https://www.terraform.io/language/meta-arguments/for_each)

## Requirements
Install Terraform - [instructions](https://www.terraform.io/downloads)

## Repo content 
```main.tf``` - Terraform configuration file
```variable.tf``` - Terraform file containing the variables

## Guide
1. First download the repo https://github.com/igabrpro/Terraform_for_each_strings.git
2. Change teh directory ```cd  moved_configuration_block```
3. Execute ```terraform init``` in order to download the necessary providers
4. Execute ```terraform apply``` in order to provision the code in main.tf

```
Now you will have two VPS with cidr of 10.0.0.0/16 and 10.1.0.0/16 in us-west-1
```

## How the code works
1.first you have the follwoing variable 
```
variable "vpc" {
  type        = set(string)
  description = "list of subnets"
  default = [
    "10.0.0.0/16",
    "10.1.0.0/16",
  ]
}
```
this is variable containing set of strings

2.Second you have the following resource
```
resource "aws_vpc" "main" {
  for_each   = var.vpc
  cidr_block = each.value
}
```
Because we use for_each erraform will create one instance for each member of that set. The cidr_block will change with every run.

