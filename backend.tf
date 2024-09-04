
 terraform {
   backend "s3" {
     bucket         = "nobuckk"
     key            = "terraform/state.tfstate"
     region         = "eu-west-1"
     dynamodb_table = "noolock"
     encrypt        = true
   }
 }