resource "aws_eip" "nat_eip" {
  vpc      = true

  tags {
    Name = "${terraform.workspace}-banco-scopus-eip"
    Environment = "${terraform.workspace}"
  }	

}
