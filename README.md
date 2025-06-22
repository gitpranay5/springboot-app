# Spring Boot App with Docker, Kubernetes, Github Actions, Observability & GitOps

---

## 🚀 Features

- ✅ **Spring Boot** basic spring boot application
- ✅ **Dockerized** application container
- ✅ **Kubernetes manifests** for deployments, services, ingress
- ✅ **Ingress NGINX Controller** to expose services on a single public IP
- ✅ **Prometheus** for metrics scraping
- ✅ **Grafana** dashboards for visualization
- ✅ **GitHub Actions** CI pipeline with code checks, SonarQube scanning/unit testing, image build, and push to Docker Hub and updates the k8s manifests
- ✅ **ArgoCD** for GitOps continuous deployment


---

## 🧰 Tech Stack

| Layer              | Technology                                   |
| ------------------ | -------------------------------------------- |
| Backend            | Spring Boot                                  |
| DevOps CI/CD       | GitHub Actions + ArgoCD                      |
| Containerization   | Docker                                       |
| Orchestration      | Kubernetes on Azure Kubernetes Service (AKS) |
| Observability      | Prometheus + Grafana                         |
| Monitoring Export  | Spring Boot Actuator (/actuator/prometheus)  |
| Ingress            | NGINX Ingress Controller                     |
| Git Repository     | GitHub                                       |
| Container Registry | Azure Container Registry (ACR)               |

---

## 📂 Project Structure

```
.
├── k8s
│   ├── deployment.yaml
│   ├── ingerss.yaml
│   ├── prometheus-deployment.yaml
│   ├── grafana-deployment.yaml
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com.example.demo.DemoApplication.java
│   │   └── resources
│   │       ├── application.properties
├── .github
│   └── workflows
│       └── ci.yml
├── Dockerfile
├── README.md
```

---

## ⚙️ CI Pipeline (GitHub Actions)

1. **Code Checkout**
2. **Build Spring Boot Application**
3. **SonarQube Code Analysis**
4. **Build Docker Image**
5. **Push to Docker Hub**
6. **Update Kubernetes Manifests (image tag)**
7. **ArgoCD Sync (auto/manual)**

---

## 🔀 GitOps Workflow with ArgoCD

- ArgoCD watches the GitHub repository for changes
- Syncs Kubernetes manifests with the cluster
- Ensures declarative and version-controlled deployment

---

## 📊 Observability

### Prometheus

- **Metrics Path**: `/actuator/prometheus`
- **Target**: Spring Boot Service in `default` namespace
- **Config**:

```yaml
scrape_configs:
  - job_name: 'springboot-app'
    metrics_path: /actuator/prometheus
    static_configs:
      - targets: ['springboot-app-service.default.svc.cluster.local:80']
```

### Grafana

- **Default Port**: 3000 (exposed via Ingress on `/grafana`)
- **Prometheus Data Source**: `http://cluste.dns:port`
- **Dashboards**: Imported prebuilt dashboard 4701 JVM, memory requests, etc.

---

## 🌐 How to Access

| Service    | URL                             |
| ---------- | ------------------------------- |
| App        | `http://<public-ip>/spring`     |
| Prometheus | `http://<public-ip>/prometheus` |
| Grafana    | `http://<public-ip>/grafana`    |

> Note: Replace `<public-ip>` with the ingress LoadBalancer IP or domain.

---

## 🧪 How to Run

1. Clone the repo

```bash
git clone https://github.com/gitpranay5/springboot-app.git
cd springboot-app
```

2. Build and Push Docker Image
In this project I build and pushed to Docker Hub, you can do this locally or push to ACR.
```bash
docker build -t <acr-name>.azurecr.io/springboot-app:latest .
docker push <acr-name>.azurecr.io/springboot-app:latest
```

3. Apply Kubernetes Manifests

```bash
kubectl apply -f k8s/
```

4. Verify Deployment

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

---

## 🚧 Future Enhancements

- Add alerting rules in Prometheus
- Add Loki/ELK for log aggregation
- Set up Horizontal Pod Autoscaling (HPA)
- Set RBAC for observability 
- Secure endpoints with authentication
- Helm chart packaging

---

## 👨‍💻 Author

Made with 💻 by [@gitpranay5](https://github.com/gitpranay5)

---

> This project demonstrates a DevOps lifecycle with modern tools and best practices. Contributions are welcome!

