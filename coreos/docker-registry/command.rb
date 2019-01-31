$vagrant_up_run_command = [
  "docker run -d -p 5000:5000 -v /var/opt:/var/lib/registry registry:2.3.0",
  "docker run -d -e ENV_DOCKER_REGISTRY_HOST=192.168.99.100 -e ENV_DOCKER_REGISTRY_PORT=5000 -p 8080:80 konradkleine/docker-registry-frontend:v2"
  ] 
