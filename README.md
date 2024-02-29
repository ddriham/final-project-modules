final-project-modules

This repository contains the Terraform modules used for provisioning infrastructure components in a Kubernetes environment for a DevOps course final project. Each module is designed to be reusable and is responsible for setting up a specific piece of the infrastructure.

Modules Description
- `vpc`: Includes the module to provision a VPC that will host the EKS cluster.
- `eks`: This directory holds the modules for creating and managing the Amazon EKS cluster.
- `addons`: These modules are responsible for deploying essential Kubernetes addons, such as an ingress controller, autoscaler, metrics server, persistent storage with EBS, monitoring with Prometheus, and visualization with Grafana.
- `argocd`: Contains modules for setting up Argo CD, a continuous deployment tool for Kubernetes, ensuring that applications are deployed as defined in the repository.

Each module is organized into separate directories for clarity and separation of concerns.

nothing hard coded on this modules, fill free to use!
