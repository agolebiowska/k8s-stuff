# Skaffold example

The pipeline is:

- Building a Docker image from the source using the Dockerfile
- Tagging the Docker image with the sha256 hash of its contents
- Updating the Kubernetes manifest, k8s.yml, to use the image built previously
- Deploying the Kubernetes manifest using kubectl apply -f
- Streaming the logs back from the deployed app
