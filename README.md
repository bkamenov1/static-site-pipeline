# Static Website Deployment with Azure Pipelines

This project demonstrates a fully automated CI/CD pipeline that deploys a static website to Azure Blob Storage using Azure DevOps Pipelines.

## 🚀 Features

- Uses Azure CLI and Azure DevOps YAML pipelines
- Static website hosted on Azure Storage (Static Website Hosting)
- CI/CD triggered on every commit to `main`
- Infrastructure managed with Azure CLI in pipeline

## 💻 Technologies Used

- Azure DevOps Pipelines
- Azure CLI
- GitHub
- Bash / YAML
- Azure Storage (Static Website)

## 🔄 Pipeline Flow

1. Trigger on commit to `main`
2. Create resource group and storage account (if not exists)
3. Enable static website hosting
4. Upload `index.html` to `$web` container
5. Output the URL of the deployed site

## 🌐 Live Demo

[Click here to view the deployed site](https://YOURSTORAGEACCOUNT.z13.web.core.windows.net)

## 📂 Repository Structure

