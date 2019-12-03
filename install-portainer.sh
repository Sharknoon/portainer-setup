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

PORT=9000

docker volume create portainer_data

docker create \
  -p $PORT:9000 \
  -p 8000:8000 \
  --name portainer \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  -v /etc/letsencrypt/live/netcup.sharknoon.de/fullchain.pem:/certs/fullchain.pem \
  -v /etc/letsencrypt/live/netcup.sharknoon.de/privkey.pem:/certs/privkey.pem \
  portainer/portainer:latest \
  --ssl \
  --sslcert /certs/fullchain.pem \
  --sslkey /certs/privkey.pem \

docker network connect portainer-net portainer
