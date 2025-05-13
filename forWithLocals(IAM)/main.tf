provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Define users and groups using local blocks
locals {
  users = {
    alice = {
      username = "alice"
      groups   = ["developers", "ops"]
    }
    bob = {
      username = "bob"
      groups   = ["architects"]
    }
    charlie = {
      username = "charlie"
      groups   = ["security"]
    }
  }

  group_policies = {
    developers = [
      "arn:aws:iam::aws:policy/PowerUserAccess",
      "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
    ]
    ops = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      "arn:aws:iam::aws:policy/AWSCloudFormationReadOnlyAccess"
    ]
    architects = [
      "arn:aws:iam::aws:policy/AdministratorAccess"
    ]
    security = [
      "arn:aws:iam::aws:policy/SecurityAudit",
      "arn:aws:iam::aws:policy/AWSKeyManagementServicePowerUser"
    ]
  }
}

# Create IAM groups
resource "aws_iam_group" "groups" {
  for_each = toset(keys(local.group_policies))
  name     = each.key
}

output "groups" {
    value = toset(keys(local.group_policies))
  
}

# Attach multiple policies to groups
resource "aws_iam_group_policy_attachment" "group_policy_attachments" {
  for_each = {
    for pair in flatten([
      for group, policies in local.group_policies : [
        for policy in policies : {
          group  = group
          policy = policy
        }
      ]
    ]) : "${pair.group}-${pair.policy}" => pair
  }

  group      = aws_iam_group.groups[each.value.group].name
  policy_arn = each.value.policy
}

output "group_policies" {
  value = {
    for pair in flatten([
      for group, policies in local.group_policies : [
        for policy in policies : {
          group  = group
          policy = policy
        }
      ]
    ]) : "${pair.group}-${pair.policy}" => pair
  }
}

# Create IAM users
resource "aws_iam_user" "users" {
  for_each = local.users
  name     = each.value.username
}


# Build a map of group => list of users in that group
locals {
  group_members = {
    for group in keys(local.group_policies) :
    group => [
      for user, details in local.users : details.username
      if contains(details.groups, group)
    ]
  }
}

resource "aws_iam_group_membership" "group_membership" {
  for_each = local.group_members

  name  = "${each.key}-membership"
  group = aws_iam_group.groups[each.key].name
  users = each.value
}