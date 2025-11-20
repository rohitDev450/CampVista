## CampVista – Cloud-Native Campsite Booking Platform
```bash
End-to-End DevOps Project | Jenkins • SonarQube • Trivy • Docker • Kubernetes • EKS • ArgoCD • AWS ALB
```

## 📌 Project Overview

CampVista is a production-grade, cloud-native campsite booking website deployed on AWS EKS using a complete DevOps toolchain.

This project demonstrates:

- CI with Jenkins

- Code Quality via SonarQube

- Vulnerability Scanning via Trivy + OWASP

- Docker Image Build & Push

- Kubernetes Deployment (Deployment, HPA, Service, Ingress)

- GitOps using ArgoCD

- Autoscaling using Kubernetes HPA

- Production-grade AWS ALB for public access

- This repository showcases real-world DevOps engineering with security, automation, orchestration, and cloud deployment.

## 🛠️ Tools & Technologies
- Category	Tools
- CI/CD	Jenkins
- Code Quality	SonarQube
- Security	Trivy, OWASP Dependency Check
- Containerization	Docker
- Kubernetes	EKS, kubectl, HPA
- GitOps	ArgoCD
- AWS	EC2, IAM, ALB, VPC, Subnets, Route Tables
- Repository	GitHub

##

## 📸 Project Screenshots

✅ CI/CD Pipeline (Jenkins)

<img width="1920" height="1080" alt="Screenshot (261)" src="https://github.com/user-attachments/assets/b8a25032-7e03-48d4-95f7-8e5acab3e164" />

##

🌐 Live Website on AWS ALB

<img width="1920" height="1080" alt="Screenshot (286)" src="https://github.com/user-attachments/assets/9a676536-b8ec-4841-817c-9c7c1435c220" />

##

🧭 ArgoCD GitOps Deployment

<img width="1920" height="1080" alt="Screenshot (285)" src="https://github.com/user-attachments/assets/eb106d55-3c4e-408d-87e8-45f5015fb87b" />

##

🖥️ AWS EC2 & Infra Overview

<img width="1920" height="1080" alt="Screenshot (287)" src="https://github.com/user-attachments/assets/947dc81b-f552-4d68-b377-e44ee0e6aa04" />


##

## 🏗️ High-Level Architecture
```bash
Developer Pushes Code
        |
        v
   GitHub Repo
        |
        v
 Jenkins CI Pipeline
 ----------------------------------------
 | Checkout | SonarQube | Trivy | Docker |
 ----------------------------------------
        |
        v
 Docker Image → Docker Hub
        |
        v
 ArgoCD Watches Git Repo
        |
        v
 Kubernetes (AWS EKS)
 ---------------------------------------------------
 | Deployment | HPA | Service | Ingress (ALB) |
 ---------------------------------------------------
        |
        v
   AWS Application Load Balancer
        |
        v
   End-users access the website

```

##

## 📦 Project Setup & Commands

1️⃣ Clone Repository
```bash
git clone https://github.com/your-username/campvista.git
cd campvista
```

2️⃣ Jenkins CI Pipeline

- Install required Jenkins plugins:

- Git

- Pipeline

- SonarQube Scanner

- OWASP Dependency Check

- Docker Pipeline

- Run the pipeline manually or trigger via Git webhook.


3️⃣ SonarQube Setup (Local or EC2)

Run SonarQube locally:

```bash
docker run -d --name sonar -p 9000:9000 sonarqube:lts
```

## Generate a Sonar token → add to Jenkins credentials.


4️⃣ Trivy Security Scan
```bash
trivy filesystem .
trivy image your-docker-image
```

5️⃣ Docker Build & Push
```bahs
docker build -t campvista-app .
docker tag campvista-app rohitaute450/campvista:latest
docker push rohitaute450/campvista:latest
```

6️⃣ Kubernetes Deployment on AWS EKS

Update kubeconfig:
```bash
aws eks update-kubeconfig --region ap-south-1 --name campvista-project
```

Apply all manifests:
```bash
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f hpa.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```


7️⃣ ArgoCD GitOps Setup
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f install.yaml
```

Login:
```bash
argocd admin initial-password -n argocd
```


8️⃣ AWS ALB Ingress Configuration

- Add these annotations in ingress.yaml:
```bash
annotations:
  kubernetes.io/ingress.class: alb
  alb.ingress.kubernetes.io/scheme: internet-facing
```

##

## ⭐ Features Implemented

- ✔️ Full CI/CD automation
- ✔️ Static code analysis via SonarQube
- ✔️ Trivy & OWASP vulnerability scanning
- ✔️ Docker image build + push
- ✔️ Kubernetes autoscaling with HPA
- ✔️ GitOps deployment with ArgoCD
- ✔️ AWS ALB routing for internet access
- ✔️ Zero-downtime deployments
- ✔️ Fully cloud-managed infrastructure

  ##
