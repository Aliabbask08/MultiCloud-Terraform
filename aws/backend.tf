terraform{
backend "s3"{
bucket = "aliabbasbucket08"
key = "terraform.tfstate"
region = "ap-south-1"
}
}
