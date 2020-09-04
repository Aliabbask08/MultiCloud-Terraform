resource "aws_vpc" "vpc"{
     cidr = "var.cidr"
     
     tags = {
         Name = "var.vpc_tag"


}


}
