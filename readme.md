# MySQL/MariaDB Exporter for Railway

This repository contains the configuration for deploying Prometheus MySQL/MariaDB Exporter on Railway platform.

## Overview

The MySQL/MariaDB Exporter allows you to monitor your MariaDB database metrics using Prometheus and visualize them with Grafana. This setup is specifically designed for Railway.app deployment.

## Prerequisites

Before deploying this exporter, you need to:

1. Have a MariaDB database running on Railway or accessible from Railway
2. Create a monitoring user in your MariaDB database with appropriate permissions

## Database User Setup

Create a dedicated user in your MariaDB database with the following permissions:

```sql
CREATE USER 'exporter'@'%' IDENTIFIED BY 'YOUR_SECURE_PASSWORD';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';
FLUSH PRIVILEGES;
```

> Replace `YOUR_SECURE_PASSWORD` to your password

> Note the use of '%' instead of 'localhost' as the exporter will connect from a different host.

Environment Variables
Configure the following environment variables in Railway:
```
HOST - Your MariaDB host (Railway internal URL or external address)
PORT - MariaDB port (usually 3306)
USER - Database user created for monitoring
PASSWORD - User's password
```

## Deployment

Connect it to Railway
Set the required environment variables
Deploy

Railway will automatically build and deploy the service using the Dockerfile provided in this repository.
Testing the Exporter
Once deployed, you can verify the exporter is working by visiting:
https://your-railway-service-url/metrics
You should see a list of MariaDB metrics being exported.

## Integrating with Prometheus

Add the following configuration to your Prometheus configuration (prometheus.yml):

```yaml
scrape_configs:
  - job_name: 'mariadb'
    static_configs:
      - targets: ['YOUR_RAILWAY_SERVICE_URL:9104']
    labels:
      alias: 'mariadb'
```

## Recommended Grafana Dashboards
After connecting your Prometheus instance to Grafana, import these dashboards:

Dashboard ID: 14621 - MySQL/MariaDB Workload\
Dashboard ID: 13106 - Galera/MariaDB Overview\
Dashboard ID: 7362 - MySQL Overview

## Available Metrics
The exporter provides numerous metrics, including but not limited to:

Query performance statistics\
Connection statistics\
Buffer pool utilization\
InnoDB metrics\
Replication lag (if applicable)\
Table statistics
