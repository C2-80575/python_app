#!/bin/bash

# Build Docker image
/usr/bin/docker image build -t amritesh21/python_app .

# Login to Docker Hub
echo "dckr_pat_5VDml6jpBiBeqbRa5C6GXX9qc3Q" | docker login -u amritesh21 --password-stdin

# Remove existing Docker service if it exists
existing_service=$(docker service ls --filter "name=myservice" --quiet)
if [ -n "$existing_service" ]; then
    /usr/bin/docker service rm myservice
fi

# Push Docker image to Docker Hub
/usr/bin/docker image push amritesh21/python_app

# Create Docker service
/usr/bin/docker service create --name myservice --replicas 5 -p 4000:4000 amritesh21/python_app

