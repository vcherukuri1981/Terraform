
// This example demonstrates how to use a for loop in a list using locals in Terraform.

 locals {
 my_numbers   = [1, 3, 5, 2, 8, 12, 33, 10]
 even_numbers = [for number in local.my_numbers : number if number % 2 == 0]
 odd_numbers  = [for number in local.my_numbers : number if number % 2 != 0]
 even_numberindex= [for index, number in local.my_numbers : index if number % 2 == 0]
}

output "even_numbers" {
 value = local.even_numbers
}

output "odd_numbers" {
 value = local.odd_numbers
}
output "even_numberindex" {
 value = local.even_numberindex
}


////////////////

locals {
  data = yamldecode(file("./instances.yaml"))
  // take only the instances that are in the dev environment and build a map with them:
  dev = [for data in local.data : { for instance_key, instance_value in data : instance_key => instance_value if instance_value.env == "dev" }]
  dev1   = merge([for data in local.data : { for instance_key, instance_value in data : instance_key => instance_value if instance_value.env == "dev" }]...)

   dev2 = [for data in local.data:{for instance_key, instance_value in data : instance_key =>instance_value if instance_value.env == "dev" }]
}

output "data"{
    value = local.data
}

output "dev2" {
  value = local.dev2
}


////////////////////////////////////////////////////

locals {
 pet_map = {
   cat = {
     color = "orange"
     age   = "7"
   }
   dog = {
     color = "white"
     age   = "5"
   }
 }

 pet_type = [for key, key_values in local.pet_map : key]
 pet_color =toset(flatten([for value in local.pet_map : value.color if value.color == "white"]))
}

output "pet_type" {
 value = local.pet_type
}
output "pet_colors" {
 value = local.pet_color
}






