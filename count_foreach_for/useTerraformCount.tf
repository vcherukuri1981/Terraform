# This is a simple example of using count to create multiple resources in Terraform.
# In this example, we will create 3 S3 buckets using the count parameter.

resource "aws_s3_bucket" "s3buckets" {
  count  = length(var.s3_names)
  bucket = var.s3_names[count.index]

  tags = {
    Name        = var.s3_names[count.index]
    environment = "dev"
    terraform   = "true"
  }


}

variable "s3_names" {
  type        = list(string)
  default     = ["vcheruk301", "vcheruk302", "vcheruk303"]
  description = "List of S3 bucket names to create"

}

