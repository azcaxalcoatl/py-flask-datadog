# py-flask-datadog

A football data API using Flask to test Datadog instrumentation.

This repository contains a sample API built using Flask, with integrated Datadog Application Performance Monitoring (APM) to provide insights into the application’s performance and health. The goal of this project is to demonstrate how to set up a basic Flask API and instrument it with Datadog for monitoring and observability purposes.

[Here](https://www.linkedin.com/pulse/instrumenting-flask-apis-datadog-apm-beginners-journey-raphael-konno-pgdfc?utm_source=share&utm_medium=member_ios&utm_campaign=share_via) you read a full article of this project, why he is created and a demonstration of use. Can be useful for an entire comprehend.

## Features
- **Flask API**: A simple RESTful API built using Flask.
- **Datadog APM**: Instrumentation with Datadog to monitor the performance and health of the API.
- **Dockerized Setup**: Easily deploy the application using Docker and Docker Compose.
- **Terraform Infrastructure**: Infrastructure as Code (IaC) using Terraform to set up optional AWS resources.

## Installation
1. Clone the repository:
```sh
git clone https://github.com/azcaxalcoatl/py-flask-datadog
```

2.	Navigate to the project directory:
```sh
cd py-flask-datadog
```

3. Change the environment variables of the docker-compose.yaml file:
```sh
vim docker-compose.yaml
```


4. Run the docker-compose.yaml file.
```sh
docker-compose up -d
```