# terraform-gcp-backend-simple-example
This repo contains a simple instance launched with terraform using backend in GCS.


# 1 Create a Bucket

* Create file terraform.tfvars
```
GCP Settings
gcp_project = "your-project"
gcp_region  = "your-region"
gcp_auth_file = "credential.json"
# Bucket
bucket-name   = "terraform_state_lock" 
storage-class = "REGIONAL"
```

* Lauch terraform 
```
Terraform init
Terraform plan
terraform apply
```

# 2 Create a VM instance using backend

* Create file backend.tf
```
terraform {
  backend "gcs"{
    bucket      = "terraform_state_lock_beltrame"
    prefix      = "dev/instance1" 
    credentials = "credentials.json"
  }
}
```
*** NOTE: DEV and the folder the following name is a subfolder where tfstate is stored and versioned. *** 

* Create terraform.tfvars
```
instance_name         = "your name"
instance_machine_type = "your type"
instance_zone         = "your zone"
instance_image        = "your image"
subnet_name           = "default"
external_enabled      = true
project               = "your project"
region                = "yout regions"
```
* Edit variables.tf
```
variable "credentials" {
  default = "credentials.json
```

* Lauch terraform 
```
Terraform init
Terraform plan
terraform apply
```

# 3 Check Versions

```
gsutil ls -a gs://terraform_state_lock/dev/instance
```
