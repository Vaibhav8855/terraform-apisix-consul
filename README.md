# terraform-apisix-consul

This repository contains Terraform configurations, Helm charts, and Kubernetes manifests to deploy an Apache APISIX API Gateway integrated with Consul service discovery on an Azure Kubernetes Service (AKS) cluster.

---

## Project Structure

- **main.tf** — Azure infrastructure resources: Resource Group, Virtual Network, Subnet, and AKS cluster.
- **provider.tf** — Terraform provider configuration (Azure).
- **variables.tf** — Input variables for your Terraform deployment.
- **output.tf** — Terraform outputs.
- **helm/** — Helm charts and values files for APISIX and Consul deployments.
- **manifest/** — Kubernetes manifests for sample applications, including a sample HTTPBin app.

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version 1.x or above)
- Azure CLI installed and configured (`az login`)
- An Azure subscription with permissions to create resources
- [kubectl](https://kubernetes.io/docs/tasks/tools/) configured to access your AKS cluster
- [Helm](https://helm.sh/docs/intro/install/) installed

---

## Usage

### 1. Deploy Azure infrastructure with Terraform

Initialize Terraform:

```bash
terraform init
````

Plan the deployment to preview resources:

```bash
terraform plan
```

Apply the deployment:

```bash
terraform apply
```

This creates:

* Resource group
* Virtual network and subnet
* AKS cluster with system-assigned managed identity

---

### 2. Configure Kubernetes access

Once AKS is deployed, configure `kubectl`:

```bash
az aks get-credentials --resource-group <resource_group_name> --name <aks_cluster_name>
```

---

### 3. Deploy Helm charts for APISIX and Consul

Use the Helm charts in the `helm/` directory to deploy APISIX and Consul to the AKS cluster:

```bash
helm install consul ./helm/helm-consul.tf -f ./helm/consul-values.yaml
helm install apisix ./helm/helm-apisix.tf -f ./helm/apisix-values.yaml
```

*(Adjust the chart install commands if your Helm chart directories or names differ.)*

---

### 4. Deploy Sample Application

Apply the sample app manifest:

```bash
kubectl apply -f ./manifest/sample-app.yaml
```

This deploys the HTTPBin app into the `httpbin` namespace, which you can use to test APISIX routing and service discovery.

---

## Variables

Refer to `variables.tf` for configurable parameters like:

* Azure resource names and locations
* Node pool sizes and VM types
* Network CIDR blocks

---

## Outputs

`output.tf` exposes relevant outputs such as:

* AKS cluster name and kubeconfig info
* Resource group details

