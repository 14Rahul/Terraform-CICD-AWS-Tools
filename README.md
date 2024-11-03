# Terraform CI/CD Pipeline Setup Guide

## **Step 1: Setting Up a Remote Backend for Terraform**

In this section, we'll configure a remote backend to securely store Terraform's state file.

1. **Navigate to the Directory**: After cloning the Git repository, go to the `Terraform-Remote-Backend` directory.
2. **Run Deployment Script**: Execute the `deploy.sh` script. This script will:
   - Create an S3 bucket to store the Terraform state.
   - Set up a KMS key and alias for encryption.
   - Create a DynamoDB table with a partition key (`LockID`) to manage state locks, ensuring state consistency.


## **Step 2: Setting Up AWS CodeCommit**

Here’s how to create and configure a CodeCommit repository to store and version control your Terraform configurations.

1. **Create a CodeCommit Repository**: Use the Terraform configuration in the `cicd` folder to create the repository.
2. **Generate CodeCommit Credentials**: Set up authentication for accessing the CodeCommit repository.
3. **Set the Repository Origin**: Use the command `git remote add origin <Repository URL>` to link your local repository.
4. **Stage and Commit Changes**: Run `git add` and `git commit` to prepare your files.
5. **Push Files to Repository**: Upload critical files such as `userdata`, `.gitignore`, `buildspec.yml`, `terraform.tf`, and `web-server.tf` to the CodeCommit repository.
6. **Verify Upload**: Ensure all files have been successfully uploaded.

## **Step 3: Configuring AWS CodeBuild**

AWS CodeBuild will compile, test, and deploy your Terraform code as part of the CI/CD pipeline.

1. **Deploy CodeBuild Configuration**: Use the `codebuild.tf` Terraform file to set up CodeBuild with CodeCommit as the source repository.
2. **Test CodeBuild**: Run a test to confirm that the CodeBuild configuration is correctly set up and functioning as expected.

## **Step 4: Automating Deployment with AWS CodePipeline**

To automate deployments on every commit, we’ll configure a CodePipeline that triggers the CI/CD workflow.

1. **Deploy CodePipeline Configuration**: Use the `codepipeline.tf` file to set up CodePipeline.
2. **This Terraform Will Configure Pipeline Stages**:
   - **Stage 1 (Source)**: Pulls the latest code from CodeCommit.
   - **Stage 2 (Deploy)**: Deploys using CodeBuild.
3. **This Terraform Will Also Set Up EventBridge**: Create an EventBridge rule to trigger the pipeline on every new commit to the `master` branch.
4. **Verify Pipeline**: Ensure the pipeline is operating correctly, triggering on commits and deploying changes.

This CI/CD setup enables an efficient and automated way to manage and deploy your Terraform infrastructure as code.
