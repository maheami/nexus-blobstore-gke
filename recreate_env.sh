#!/bin/bash

set -e

cd ..

# Clone the Nexus blobstore pluging git repo
git clone https://github.com/sonatype-nexus-community/nexus-blobstore-google-cloud.git

cd nexus-blobstore-google-cloud

mvn clean package

mv Dockerfile Dockerfile.bkp

cp ../nexus-blobstore-gke/Dockerfile .
cp ../nexus-blobstore-gke/docker_deploy.yaml .

#Set your GCP Project ID
PROJECT_ID="$(gcloud config get-value project -q)"

#Build Docker Image
docker build -t gcr.io/${PROJECT_ID}/nexus-server:v1 .

#Authorised to push Docker image in GCR
gcloud auth configure-docker

#Push Docker image to GCR
docker push gcr.io/weeloy-docker-kube/nexus-server:v1

#Authorised for Kubernetes Cluster setup
gcloud container clusters get-credentials nexus

#Deploy and exposed GKE Cluster using Load Balancer
#kubectl create -f docker_deploy.yaml
kubectl create  -f docker_deploy.yaml --dry-run=true -o yaml | kubectl apply -f docker_deploy.yaml

