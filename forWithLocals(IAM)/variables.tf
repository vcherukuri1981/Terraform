variable "users" {
  description = "Map of users and their group memberships"
  type = map(object({
    username = string
    groups   = list(string)
  }))
  default = {
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
}

variable "group_policies" {
  description = "Map of groups and their associated policies"
  type = map(string)
  default = {
    developers = "arn:aws:iam::aws:policy/PowerUserAccess"
    ops        = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    architects = "arn:aws:iam::aws:policy/AdministratorAccess"
    security   = "arn:aws:iam::aws:policy/SecurityAudit"
  }
}