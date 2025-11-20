CampVista – Cloud-Native Campsite Booking Platform
End-to-End DevOps Project | Jenkins • SonarQube • Trivy • Docker • Kubernetes • EKS • ArgoCD • AWS ALB
🚀 Project Overview

CampVista is a fully automated, cloud-native web application deployed on AWS EKS using a modern DevOps toolchain.
This project demonstrates real-world CI/CD implementation with security, quality analysis, orchestration, GitOps, monitoring, and auto-scaling.

This repository showcases your skills as a DevOps Engineer by combining:

CI with Jenkins

Code Quality via SonarQube

Vulnerability Scanning via Trivy + OWASP

Docker Image Build & Push

Kubernetes Deployment (Deployment, HPA, Service, Ingress)

AWS EKS Managed Cluster

GitOps using ArgoCD

Production-grade AWS Application Load Balancer (ALB)

📸 Project Screenshots

Below screenshots are included to help recruiters clearly visualize your project.

✅ CI/CD Pipeline (Jenkins)

![Pipeline](/mnt/data/Screenshot (261).png)

🌐 Live Website Deployed on AWS ALB

![Website](/mnt/data/Screenshot (287).png)

🧭 ArgoCD GitOps Automation

![ArgoCD](/mnt/data/Screenshot (286).png)

🧪 SonarQube Code Quality Analysis

![SonarQube](/mnt/data/Screenshot (262).png)

🔍 Quality Gate Dashboard

![Quality Gates](/mnt/data/Screenshot (263).png)

🖥️ AWS EC2 & Infra Overview

![EC2](/mnt/data/Screenshot (285).png)

🚀 Architecture Diagram (High-Level)
               Developer Pushes Code
                        |
                        v
                 GitHub Repository
                        |
                        v
                Jenkins CI Pipeline
        -----------------------------------
        | Checkout | SonarQube | Trivy | Docker |
        -----------------------------------
                        |
                        v
              Docker Image Pushed to Hub
                        |
                        v
                  ArgoCD Watches Repo
                        |
                        v
                 Kubernetes (EKS)
     ----------------------------------------
     | Deployment | HPA | Service | Ingress |
     ----------------------------------------
                        |
                        v
          AWS Application Load Balancer
                        |
                        v
                User Access Website

🛠️ Tools & Technologies
Category	Tools
CI/CD	Jenkins
Code Quality	SonarQube
Security	Trivy, OWASP Dependency Check
Containerization	Docker
Kubernetes	EKS, kubectl, HPA
GitOps	ArgoCD
AWS	EC2, IAM, ALB, VPC, Route Tables, Subnets
Repos	GitHub
Monitoring	Pipeline view + ArgoCD UI
📦 Project Setup & Commands
1️⃣ Clone Repository
git clone https://github.com/your-username/campvista.git
cd campvista

2️⃣ Jenkins CI Pipeline
Install Jenkins Plugins:

Git

Pipeline

SonarQube Scanner

OWASP Dependency Check plugin

Docker Pipeline

Trigger build manually or via webhook.
3️⃣ SonarQube Setup (Local or EC2)
Run SonarQube locally:
docker run -d --name sonar -p 9000:9000 sonarqube:lts


Add Sonar token inside Jenkins credentials.

4️⃣ Trivy Security Scan
trivy filesystem .
trivy image your-docker-image

5️⃣ Docker Image Build & Push
docker build -t campvista-app .
docker tag campvista-app rohitaute450/campvista:latest
docker push rohitaute450/campvista:latest

6️⃣ Kubernetes Deployment on EKS
Update kubeconfig
aws eks update-kubeconfig --region ap-south-1 --name campvista-project

Apply manifests
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f hpa.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml

7️⃣ ArgoCD GitOps Setup
kubectl create namespace argocd
kubectl apply -n argocd -f install.yaml


Login:

argocd admin initial-password -n argocd

8️⃣ AWS Load Balancer (ALB Ingress)

Annotate ingress:

annotations:
  kubernetes.io/ingress.class: alb
  alb.ingress.kubernetes.io/scheme: internet-facing

📌 Features Implemented

✔️ Full CI/CD automation

✔️ Static code analysis

✔️ Security vulnerabilities detection

✔️ Docker image scanning

✔️ Auto-scaling using HPA

✔️ GitOps deployment via ArgoCD

✔️ AWS ALB routing

✔️ Zero-downtime rollouts

✔️ Complete cloud infrastructure
