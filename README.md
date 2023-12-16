# Zeet-cloud-kubernetes

## Overview

This repository contains Kubernetes configuration files designed to simplify the process of setting
up and managing access controls in Kubernetes environments. Users can create service accounts and
apply either an admin role or a fine-grained, customizable role depending on their specific
requirements. Additionally, a script is provided for generating a `kubeconfig` file for easy access
management.

## Directory Structure

- `roles/`
  - `00-serviceaccount.yaml` - Definition for creating a service account.
  - `01-role-admin.yaml` - Configuration for an admin role for simple installation.
  - `01-role-fine-grained.yaml` - Template for a customizable role with fine-grained access control.
  - `gen-kubeconfig.sh` - Script to generate a `kubeconfig` file for the service account.

## Getting Started

### Prerequisites

- Kubernetes cluster
- `kubectl` configured to communicate with your cluster

### Installation Steps

1. **Apply the Service Account:** Deploy the service account to your Kubernetes cluster.

   ```bash
   kubectl apply -f roles/00-serviceaccount.yaml
   ```

2. **Choose and Apply a Role:**

   - For standard administrative privileges, apply `01-role-admin.yaml`:
     ```bash
     kubectl apply -f roles/01-role-admin.yaml
     ```
   - For a customizable role with specific permissions, apply `01-role-fine-grained.yaml`:
     ```bash
     kubectl apply -f roles/01-role-fine-grained.yaml
     ```

3. **Customize the Fine-Grained Role (Optional):** Edit `01-role-fine-grained.yaml` to enable or
   disable specific permissions as needed.

4. **Generate kubeconfig:** Run the `gen-kubeconfig.sh` script to create a `kubeconfig` file for the
   new service account.
   ```bash
   bash roles/gen-kubeconfig.sh
   ```

### Rotating the Token

To rotate the token, simply delete the service account and recreate it using the above steps. Then,
rerun the `gen-kubeconfig.sh` script to generate a new `kubeconfig` file.

### Creating Additional Accounts or Rotating Secret Without Removal

If you need to create another account or rotate the secret without removing the existing one, rename
the service account in the manifest and repeat the installation process.
