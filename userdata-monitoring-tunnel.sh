#!/bin/bash
set -e

curl -fsSL https://get.docker.com | sh

systemctl enable docker
systemctl start docker

docker run -d \
  --name cloudflared \
  --restart unless-stopped \
  --network host \
  cloudflare/cloudflared:latest \
  tunnel --no-autoupdate run --token ${tunnel_token}
