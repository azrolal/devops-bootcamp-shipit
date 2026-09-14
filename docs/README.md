# DevOps Bootcamp Final Project

## 1. Project Overview

This project implements a complete DevOps infrastructure and deployment workflow on AWS.

The project covers:

- Infrastructure Provisioning with Terraform
- Configuration Management with Ansible
- Containerized application deployment with Docker
- Private container image storage using Amazon ECR
- Monitoring and Observability with Prometheus and Grafana
- Domain and secure access using Cloudflare Tunnel
- CI/CD using GitHub Actions
- Technical documentation and deployment evidence

---

## 2. Project Architecture

### AWS Region

`ap-southeast-1`

### Network

- VPC: `devops-vpc`
- VPC CIDR: `10.0.0.0/24`
- Public subnet: `10.0.0.0/25`
- Private subnet: `10.0.0.128/25`
- Internet Gateway: `devops-igw`
- NAT Gateway: `devops-ngw`
- Public route table: `devops-public-route`
- Private route table: `devops-private-route`

### Servers

| Server | Role | Private IP |
|---|---|---|
| Web Server | Public application server | `10.0.0.5` |
| Ansible Controller | Configuration management | `10.0.0.135` |
| Monitoring Server | Prometheus + Grafana | `10.0.0.136` |

> Final IP values will be verified from Terraform state after deployment.

---

## 3. Infrastructure Provisioning — 30%

### 3.1 Terraform Backend — 5%

- [ ] S3 state bucket
- [ ] Terraform backend configuration
- [ ] State successfully stored remotely

### 3.2 VPC Networking — 10%

- [ ] VPC
- [ ] Public subnet
- [ ] Private subnet
- [ ] Public route table
- [ ] Private route table
- [ ] Internet Gateway
- [ ] NAT Gateway

### 3.3 Security Groups — 5%

- [ ] Public security group
- [ ] Private security group
- [ ] Required ingress rules
- [ ] Restricted monitoring access

### 3.4 Three EC2 Instances — 10%

- [ ] Web server
- [ ] Ansible controller
- [ ] Monitoring server
- [ ] SSM instance profile

---

## 4. Configuration Management — 25%

### 4.1 Ansible Controller — 5%

- [ ] Ansible controller provisioned
- [ ] Inventory configured
- [ ] Configuration executed from controller

### 4.2 Docker — 5%

- [ ] Docker installed through Ansible
- [ ] Docker service enabled
- [ ] Docker installation verified

### 4.3 Application Container — 5%

- [ ] Application Dockerfile
- [ ] Application image built
- [ ] Container running on web server
- [ ] Port 80 exposed

### 4.4 Image to ECR — 5%

- [ ] Private ECR repository
- [ ] Image tagged
- [ ] Image pushed to ECR
- [ ] EC2 IAM permissions configured

### 4.5 Idempotent Configuration — 5%

- [ ] Ansible playbooks are repeatable
- [ ] Second execution produces no unnecessary changes

---

## 5. Monitoring & Observability — 20%

### 5.1 Prometheus — 8%

- [ ] Prometheus deployed
- [ ] `prometheus.yml` configured
- [ ] Web server metrics scraped
- [ ] Node Exporter running on web server
- [ ] Target status verified as UP

### 5.2 Grafana Dashboard — 8%

- [ ] Grafana deployed
- [ ] Prometheus configured as data source
- [ ] Dashboard created
- [ ] CPU metrics visible
- [ ] Memory metrics visible
- [ ] Disk metrics visible

### 5.3 Web Server Metrics — 4%

- [ ] Node Exporter exposes port 9100
- [ ] Prometheus receives metrics
- [ ] Grafana visualizes metrics

---

## 6. Domain & Secure Access — 15%

### 6.1 Application Domain — 5%

- [ ] Application domain configured
- [ ] DNS points to web server Elastic IP
- [ ] Application accessible through domain

### 6.2 Cloudflare Tunnel — 7%

- [ ] Cloudflare Tunnel configured
- [ ] Monitoring service exposed through tunnel
- [ ] SSL/TLS access verified

### 6.3 Monitoring Server Not Publicly Exposed — 3%

- [ ] No public monitoring port exposed
- [ ] Grafana not directly exposed to the Internet
- [ ] Monitoring access through Cloudflare Tunnel

---

## 7. Documentation — 10%

### 7.1 GitHub Pages — 3%

- [ ] GitHub Pages enabled
- [ ] Documentation published

### 7.2 Required URLs — 4%

- [ ] Application URL
- [ ] Monitoring URL
- [ ] Public repository URL

### 7.3 Structured Explanation — 3%

- [ ] Architecture documented
- [ ] Deployment steps documented
- [ ] Verification steps documented
- [ ] Screenshots/evidence included

---

## 8. CI/CD

- [ ] GitHub Actions workflow
- [ ] Code validation
- [ ] Docker image build
- [ ] Image push to ECR
- [ ] Deployment to web server
- [ ] Deployment verification
- [ ] Rollback procedure

---

## 9. Verification

### Infrastructure

- [ ] Terraform plan reviewed
- [ ] Terraform apply completed
- [ ] Terraform outputs recorded

### Configuration

- [ ] Ansible connectivity verified
- [ ] Docker installation verified
- [ ] Application container verified

### Monitoring

- [ ] Prometheus targets verified
- [ ] Node Exporter verified
- [ ] Grafana dashboard verified

### Security

- [ ] Security group rules verified
- [ ] Private servers not directly exposed
- [ ] Cloudflare Tunnel verified

---

## 10. URLs

| Resource | URL |
|---|---|
| Application | TBD |
| Monitoring | TBD |
| Repository | TBD |
| Documentation | TBD |

---

## 11. Troubleshooting

Common problems and their solutions will be documented here during implementation.

---

## 12. Deployment Evidence

Screenshots and command outputs will be added here as each rubric item is completed.

---

## 13. Final Checklist

- [ ] Infrastructure Provisioning — 30%
- [ ] Configuration Management — 25%
- [ ] Monitoring & Observability — 20%
- [ ] Domain & Secure Access — 15%
- [ ] Documentation — 10%
- [ ] Bonus items reviewed
- [ ] All required URLs working
- [ ] Monitoring dashboard working
- [ ] Final repository reviewed
- [ ] Final documentation reviewed
