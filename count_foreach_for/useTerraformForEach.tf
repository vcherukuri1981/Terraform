// This is a simple example of using the for_each loop in Terraform to create multiple S3 buckets.
// In this example, we will create 3 S3 buckets using the for_each loop.

variable "s3_names" {
  type        = list(string)
  default     = ["vcheruk301", "vcheruk302", "vcheruk303"]
  description = "List of S3 bucket names to create"

}

# The for_each loop allows us to iterate over a collection of items and create a resource for each item.
# In this case, we are using the toset function to convert the list of bucket names into a set,

resource "aws_s3_bucket" "foreach_s3" {
  for_each = toset(var.s3_names)
  bucket   = each.key


  tags = {
    Name        = each.key
    environment = "dev"
    terraform   = "true"
  }

}


