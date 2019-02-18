# nexus-blobstore-gke
Nexus Repo Server with Cloud Storage and Persistence Volume on GKE 

This code will help you to create Nexus Repository Manager with Google Cloud Storage and Persistence Volume and deploy it on GKE

# Prerequisite:

1.  Java 1.8+
2.  Maven 3.6.X
3.  Git Client
4.  Setup & Configure gcolud and kubctl
5.  Create Kubernetes cluster on GCP - gcloud container clusters create nexus --num-nodes=3
6.  Clone this nexus-blobstore-gke
7.  Execute the shell script - recreate_env.sh, This script will dowload / clone nexus-blobstore-google-cloud git repo to add Google Cloud Storage plugin to Nexus3 and deploy on the GKE cluster
    
