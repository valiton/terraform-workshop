module "my_instance" {
  source = "./modules/compute"

  names           = ["basic_module_10_1", "basic_module_10_2"]
  flavor_name     = "BWS-C1-1-2"
  security_groups = [module.http_security_group.security_group_name]
}

module "http_security_group" {
  source = "./modules/security_group"

  name      = "http_access"
  from_port = 80
  to_port   = 80
}

# We can use the Openstack Object store (Ceph S3 compatible object storage) to store the terraform state. For that to work you have to
# create the container / bucket manually either in the web gui or with the openstack cli. You also have to create openstack ec2 credentials

# 1. via UI see screenshot remote_state_bucket_bws.png or via cli  $ openstack container create <bucket-name>
# 2. $ openstack ec2 credentials create # Can this also be done in the UI?
# 3. use  the output credentials of 2. in you terragform init command
# terraform init -backend-config="access_key=< output access >" -backend-config="secret_key=<output secret>"

terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
  backend "s3" {
    bucket                      = "terraform-ws"
    endpoint                    = "https://s3.bws.burda.com"
    force_path_style            = true
    skip_requesting_account_id  = true
    key                         = "terraform.tfstate"
    region                      = "default"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_s3_checksum            = true
  }
}
