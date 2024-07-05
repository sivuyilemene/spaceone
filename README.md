# Terraform Script for AWS EC2 Instance Setup
Welcome to the Terraform script designed to automate the provisioning of an Amazon Web Services (AWS) EC2 instance. This script specifically sets up a t3.medium instance equipped with Docker, Helm, Minikube, kubectl, and the AWS CLI. Additionally, it configures necessary security groups to ensure secure access to the instance.

## Prerequisites
Before proceeding, ensure you have met the following requirements:

- An AWS account with appropriate permissions to create EC2 instances and manage security groups.
- Terraform installed on your local machine.
- AWS CLI profile configured with your credentials.

### Installing the AWS CLI
1. Install AWS CLI version 2: Follow the instructions on the official [AWS CLI installation page](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) to install the AWS CLI version 2 on your computer.
2. Configure AWS CLI: After installing the AWS CLI, configure it with your AWS credentials by running aws configure in your terminal. You will be prompted to enter your AWS Access Key ID, Secret Access Key, default region name, and output format. Ensure you're using an IAM user with sufficient permissions and avoid using the root user account.
    ```
      aws configure --profile <your-profile-name>
    ```

### Installing Terraform
1. Check Terraform Installation: To check if you have Terraform installed, run the following command in your terminal:
   ```
     terraform -version
   ```
3. Install Terraform: If Terraform is not installed, download and install it from the official [Terraform website](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

## Deploying the Infrastructure
1. Clone this repository:
   ```
      git clone https://github.com/sivuyilemene/spaceone.git
      cd spaceone
   ```
2. Initialize Terraform:
  ```
    terraform init
  ```
3. Plan the deployment to see the resources that will be created:
  ```
    terraform plan
  ```
5. Apply the configuration to create the infrastructure:
   ```
      terraform apply
   ```



License
This project is licensed under the MIT License. See the LICENSE file for details.

This README provides a comprehensive guide for setting up and using the Terraform script to provision an AWS EC2 instance with a specific set of tools and configurations.
