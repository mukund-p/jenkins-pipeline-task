# Jenkins CI/CD Pipeline with Docker
## Task-2
---
This project demonstrates a simple CI/CD pipeline using Jenkins and Docker. It automates the process of building, testing, and deploying a static web application using Nginx.

## 📁 Project Structure

├── Dockerfile <br>
├── Jenkinsfile <br>
└── index.html

- Dockerfile: Defines the Docker image, using Nginx to serve the static index.html.
- Jenkinsfile: Contains the Jenkins pipeline configuration.
- index.html: The static web page to be served.

## 🚀 Setup Instructions

1. Clone the Repository:

   ```bash
   git clone https://github.com/mukund-p/jenkins-pipeline-task.git
   ```
2. Configure Jenkins:
- Create a new Jenkins pipeline project.
- In the pipeline configuration, set the pipeline script from SCM:
  - SCM: Git
  - Repository URL: `https://github.com/mukund-p/jenkins-pipeline-task.git`
  - Branch: main

3. Run the Pipeline:
- Trigger the pipeline build.
- Jenkins will execute the stages defined in the Jenkinsfile.

## 🖼 Screenshots

### 1. Successful pipeline execution ###

![Pipeline Success](screenshots/pipeline_success.png)

---

### 2. Browser Showing Static Web App on Port 8081

![App Output](screenshots/app_running_browser.png)

---
### 3. Jenkins dashboard with pipeline listed

![Dashboard](screenshots/jenkins_dashboard.png)

---
### 4. Docker image build logs

![Docker ](screenshots/docker_image_build.png)

---

## 🔗 Accessing the Application
**Access via**: `http://localhost:8081`
