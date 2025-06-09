## Example Usage (Local Deployment)

- Change directory to example directory

```shell
cd deploy-infra/prod
```

- Set environment Variables for AWS

```shell

export TF_VAR_access_key=***
export TF_VAR_secret_key=***
```

Install Terraform Dependencies

```
terraform init
```

See Infrastructure Plan.

```bash
terraform plan
```

Apply Planned Infrastructure
```bash
terraform apply
```

Destroy the infrastructure
```
terraform destroy
```

## Terraform Output

- service_url -- For accessing web application

## Accessing APP

* For health checks ```GET``` to http://service_url/