# Terraform `count`, `for_each`, and `for` Comparison

Below is a comparison table of Terraform `count`, `for_each`, and `for`.

| Construct  | Type            | Description                        | Use Case                                                   |
|------------|-----------------|------------------------------------|-----------------------------------------------------------|
| `count`    | Meta-Argument   | Based on a count value             | Resources you are provisioning are identical              |
| `for_each` | Meta-Argument   | Based on a set of input values     | Resources change between the different instances          |
| `for`      | Expression      | Based on a set of input values     | Transform a value                                         |