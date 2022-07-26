# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction

a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started

This project creates is Infrastructure as Code(IaC) project. Using Packer and Terraform, different web server resources were deployed in Azure.

#### Policy

-   First of all a policy were created using `policy/policy_rules.json` and `policy/params.json`, this policy prevent creating resources without tags
-   Policy info after creating it:
    ![policy](./images/policy_screenshot.png)

#### Packer image

Using `server.json` VM image was created

#### Terraform code

in `main.tf` code that create the web server resources, when running the script, will ask for image id, the packer image id should be added

### Dependencies

1. Create an [Azure Account](https://portal.azure.com)
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Variables

In `vars.tf` there are group of variables that can be set during the creating of the deployment plan or before it by setting default value

1. `username` and `password`: login information to the VMs
2. `vm_count`: number of VMs to be deployed (default: 3)
3. `image_id`: the `id` of the created Packer image
4. `prefix`: prefix name for the created resources
5. `location`: location of the created resources (default: `US East`)

### Instructions

#### Policy

1. add policy definition

```
az policy definition create --name tagging-policy --rules policy/policy_rules.json
```

2. assign policy

```
az policy assignment create --policy tagging-policy
```

#### Create packer image

1. build `server.json`

```
packer build server.json
```

#### Create terraform deployment plan

1. create `solution.plan`

```
terraform plan -out solution.plan
```

### Output

#### Files

-   `solution.plan`: this file can be used to deploy the resources.

#### Resources

As shown in the diagram the following resources will be deployed
![Deployed-resources](./images/diagram.png)

-   Public id address to be accessible from the internet.
-   Load Balancer:
    -   Frontend IP Pool: 1-1 mapping with the public ip.
    -   Backend IP Pool: mapping to the VMs in their network.
-   VMs: Created VMs from the packer image.
-   Virtual network: Virtual network for the VMs, that contains subnets.
-   Security rules: to deny access to the internet and allow communication between the VMs.
