provider "aws"{
    region = var.aws_region
}


terraform{
  backend "s3" {
    bucket = "terraform-state-igti-eurico" #esse bucket deve ser criado manualmente  
    key    = "state/igti/edc/mod1/terraform.tfstate"  
    region = "us-east-2"
  }    
}