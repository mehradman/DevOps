# Minio with Traefik

This `docker-compose` configuration sets up Minio with Traefik as a reverse proxy, enabling secure access with HTTPS.

## Prerequisites

- Docker
- Docker Compose

## Running the Setup

### 1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   cd <repository-name>
   ```
### 2. **Create a .env file with the following variables:**
```sh
MINIO_ROOT_USER=<your-minio-root-user>
MINIO_ROOT_PASSWORD=<your-minio-root-password>
MINIO_SUB1=<subdomain-for-minio-console>
MINIO_SUB2=<subdomain-for-minio-api>
DOMAIN_ADDRESS=<your-domain>
RESTART_POLICY=<your-restart-policy>
```
### 3. **Start the services:**
```sh
docker-compose up -d
```
### 4. **Access Minio Console:** Open your browser and go to `https://<MINIO_SUB1>.<DOMAIN_ADDRESS>`
### 5. **Access Minio API:** Open your browser and go to `https://<MINIO_SUB2>.<DOMAIN_ADDRESS>`

## MinIO CLI

For detailed information on installing and configuring the MinIO CLI, please visit the [MinIO CLI Reference](https://min.io/docs/minio/linux/reference/minio-mc.html).

### Enable Autocompletion:

```bash
mc --autocompletion bash
```

