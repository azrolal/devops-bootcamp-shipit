# 6. CI/CD

## Overview

Continuous Integration and Continuous Deployment (CI/CD) digunakan untuk mengautomasikan proses validation, build dan deployment aplikasi.

Projek ini menggunakan **GitHub Actions** sebagai platform CI/CD.

Setiap perubahan yang di-push ke repository akan mencetuskan workflow secara automatik. Workflow ini menjalankan proses installation, build, testing dan deployment.

CI/CD membantu memastikan application melalui proses yang konsisten dan reproducible tanpa bergantung kepada manual execution pada local development machine.

---

# 6.1 CI/CD Tools

| Tool | Purpose |
|---|---|
| GitHub | Source Code Management |
| GitHub Actions | CI/CD Automation |
| Node.js | Application Runtime |
| npm | Dependency Management |
| Vite | Production Build Tool |
| GitHub Pages | Static Website Deployment |

---

# 6.2 GitHub Actions Workflow

GitHub Actions workflow didefinisikan dalam repository pada lokasi:

```text
.github/workflows/deploy.yml
