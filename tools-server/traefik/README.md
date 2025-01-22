# Traefik Reverse Proxy with Docker Compose

This repository contains a Docker Compose configuration to set up Traefik as a reverse proxy and load balancer. This setup enables you to manage routing, secure connections, and monitoring with ease.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### 1. Create an .env File
Create an .env file in the root directory and add the following environment variables:
```sh
RESTART_POLICY=<your-restart-policy>
HOSTNAME=<your-hostname>
ACME_EMAIL=<your-email>
TRA_SUB=<your-traefik-subdomain>
DOMAIN_ADDRESS=<your-domain>
WEB_AUTH_USER=<your-basic-auth-user>
WEB_AUTH_PASS=<your-basic-auth-password>
```

### 2. Run Docker Compose
Use Docker Compose to start the Traefik service:
```bash
docker-compose up -d
```

## Access Traefik Dashboard
After starting the services, you can access the Traefik dashboard at `https://<TRA_SUB>.<DOMAIN_ADDRESS>`.