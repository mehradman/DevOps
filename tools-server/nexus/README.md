# Sonatype Nexus with Traefik

This project sets up Sonatype Nexus using Docker Compose with Traefik as the reverse proxy. The setup includes multiple subdomains for different services.

## Services

The setup includes the following services, each accessible through a unique subdomain:

### Sonatype Nexus

Nexus is a repository manager that allows you to proxy, collect, and manage your dependencies. It makes it easier to distribute and share artifacts within your organization.

### Hub Service

The Hub Service is used for managing Docker images. It helps in hosting and managing your private Docker image registry.

### Registry Service

This service acts as a Docker registry, where you can store and distribute your Docker images. It is compatible with Docker's native commands.

### Quay Service

Quay is an enterprise-level container registry that provides image vulnerability scanning, detailed permissions, and repository replication.

### K8s Service

The K8s (Kubernetes) Service is a registry specifically for Kubernetes, allowing you to manage and store your Kubernetes-related images.

## Prerequisites

Before you begin, ensure you have the following installed:
- Docker
- Docker Compose

## Setup

### 1. Create a .env file with the following variables:
```sh
NEXUS_IMAGE_TAG=<find-latest-tag-in-dockerhub>
HOSTNAME=<your-hostname>
RESTART_POLICY=<your-restart-policy>
NEXUS_SUB_DOMAIN=<subdomain-for-nexus>
HUB_SUB_DOMAIN=<subdomain-for-docker-mirror>
REGISTRY_SUB_DOMAIN=<subdomain-for-docker-registry>
QUAY_SUB_DOMAIN=<subdomain-for-quay>
K8S_SUB_DOMAIN=<subdomain-for-k8s>
DOMAIN_ADDRESS=<your-domain>
```

### 2. Start the services:
```bash
docker-compose up -d
```
## Accessing the Services
To reach the services, use the subdomains configured in your .env file along with the main domain. Here are the details:

### 1. Sonatype Nexus:

URL: `https://${NEXUS_SUB_DOMAIN}.${DOMAIN_ADDRESS}`
Port: 8081

### 2. Hub Service:

URL: `https://${HUB_SUB_DOMAIN}.${DOMAIN_ADDRESS}`
Port: 8082

### 3. Registry Service:

URL: `https://${REGISTRY_SUB_DOMAIN}.${DOMAIN_ADDRESS}`
Port: 8083

### 4. Quay Service:

URL: `https://${QUAY_SUB_DOMAIN}.${DOMAIN_ADDRESS}`
Port: 8084

### 5. K8s Service:

URL: `https://${K8S_SUB_DOMAIN}.${DOMAIN_ADDRESS}`
Port: 8085
