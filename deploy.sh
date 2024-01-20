#!/bin/bash

# Build Docker image
/usr/bin/docker image build -t amritesh21/python_app .

# Login to Docker Hub
echo "dckr_pat_I67O0DVi9OEGPY1Ngs5-O_K4Ivg" | docker login -u amritesh21 --password-stdin

# Push Docker image to Docker Hub
/usr/bin/docker image push amritesh21/python_app

# Remove existing Docker service (if it exists)
/usr/bin/docker service rm myservice || true

# Create Docker service
/usr/bin/docker service create --name myservice --replicas 5 -p 4000:5000 amritesh21/python_app

