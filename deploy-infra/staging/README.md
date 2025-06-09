## Usage

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

## Accessing API


To access the API, you can use PostMan or any other HTTP Client of your choice

* To get  ```GET``` to http://service_url/factorial?value=5

```
{"function":"factorial","input":"5","output":120}

```

* For health checks ```GET``` to http://service_url/