# Terraform AWS Security Group with Dynamic Blocks

This Terraform code defines an AWS security group using **dynamic blocks** for both ingress and egress rules.

---

## Dynamic Blocks

- `dynamic "ingress"` and `dynamic "egress"` allow you to generate multiple security group rules based on input variables, rather than hard-coding each rule.
- `for_each = var.ingress_rules` and `for_each = var.egress_rules` loop over the maps defined in the variables, creating one rule per map entry.

---

## How It Works

### Variables

- **ingress_rules** and **egress_rules** are maps of objects, each describing a rule (ports, protocol, CIDRs, description, and a rule name).

### Resource

- For each entry in `ingress_rules`, a security group ingress rule is created.
- For each entry in `egress_rules`, a security group egress rule is created.

### Dynamic Block Content

- The block’s attributes (`from_port`, `to_port`, `protocol`, etc.) are set from the values in each rule object.

---

## Example

If `ingress_rules` contains `http`, `https`, and `ssh`, three ingress rules are created in the security group.

---

## Benefits

- **Scalability:** Easily add or remove rules by changing the variables.
- **Reusability:** The same code works for any number of rules.