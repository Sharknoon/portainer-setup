# Creating the portainer agent for easy access to volumes

docker network create portainer-net

AGENT_PORT=9001

docker create \
  --name portainer-agent \
  --restart always \
  -e CAP_HOST_MANAGEMENT=1 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v /:/host \
  --net portainer-net \
  portainer/agent:latest

# Creating the portainer itself

docker volume create portainer_data

docker create \
  -p 9000:9000 \
  -p 8000:8000 \
  --name portainer \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer:latest

docker network connect portainer-net portainer
