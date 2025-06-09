# mews-snooze

Application deployed on AWS ECS Infrastructure

## STACK
* language: Javascript & Hcl
* Infrastructure: Docker
* Cloud Deployment: AWS and Terraform

## SOLUTION APPROACH

### Code
The code is built using Javascript and HTLM 

### Infrastructure
Docker is used to maintain infrastructure deployment and ensure deploying to an isolated environment 


### Deploying with Docker
* This solution is deployed using Docker. 

- Build docker image; Run the below command within the folder that contains the DockerFile

```
cd Application

```

```
docker build --tag container-app .
```

- Running the docker container

```
docker run -d --name app -p 80:80 container-app
```

![Docker infra](img/workflow.png)

### Deploy to AWS Using Terraform
To deploy this solution to the cloud, two main technologies are required -- Cloud platform(AWS), Terraform

- Terraform -- Terraform would be used to instantiate and manage the infrastructure the application would run on, this means, we get the ability to manage the state and the lifecycle of the infrastructure using terraform workflow

- Cloud Platform -- Any cloud provider is fine for deployment, For AWS, I leverage the following service

```
- AWS ECS -- Fargate
- Docker -- For hosting the container
- IAM -- Access and Security
- LB -- Loadbalancing
- Security Groups
- AWS VPCs
- AWS Cloudwatch

```

### Terraform Structure
The IaC code is modularized, meaning, it is built into reusable modules called child module, the child module is located at:

```
cd core-infra
```

Also built with the child module, is a deployable module called the root module. The root module installs and uses resources defined in the child module for deployment. The root module is broken into 3 seperate environments `dev`, `staging`, `prod` assuming these environments are in different `AWS Accounts` and instructions on deployments can be found here:

```
cd deploy-infra
```
- A README with instructions on how to deploy the infrastructure is placed at in the folder.

==> The docker container with the code base has been pre-built and deployed to a public repository for easy pull and deployment.


### Infrastructural Diagram and Reference (ECS Infrastructure)

![ECS infra](img/infra_diag.png)
