# mitlib-tf-template

Template for Terraform repos for MIT Libraries.

After deploying this, the following steps must be completed.

1. Update the `terraform { }` block in `main.tf` to name the correct workspace in Terraform Cloud (or remove the backend completely if this will be running solely in Terraform Cloud).
1. Update `main.tf` to include any additional Terraform Provider(s).
1. Update the `terraform { required_providers { } }` block `versions.tf` to set the location and constraints on the additional providers.

## File Tree

```bash
.
├── LICENSE
├── README.md
├── docs
│   └── adrs
│       └── 0001-record-architecture-decisions.md
├── main.tf
├── modules
│   └── README.md
├── providers.tf
├── tests
│   └── README.md
├── variables.tf
└── versions.tf
```


