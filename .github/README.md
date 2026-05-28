# Minecraft Client in Docker

Run [Minecraft Java](https://www.minecraft.net/en-us/download) directly in your browser.  
Container built on [linuxserver/docker-baseimage/selkies](https://github.com/linuxserver/docker-baseimage-selkies), running the official release of [Minecraft](https://www.minecraft.net/en-us/download)  

## Application Setup

The application can be accessed at:

* http://yourhost:3000/
* https://yourhost:3001/

## Usage

Some snippets to get you started.

### docker-compose

```yaml
services:
  minecraft-client:
    image: ghcr.io/lanjelin/minecraft-client-docker:latest
    container_name: minecraft-client
    devices:
      - /dev/dri:/dev/dri
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Oslo
      - DRINODE=/dev/dri/renderD128
      - DRI_NODE=/dev/dri/renderD128
      - AUTO_GPU=true
      - CUSTOM_USER=JohnDoe # optional, but recommended if exposing to -
      - PASSWORD=a-safe-pw  # the internet without any other form of authentication
    ports:
      - "3000:3000" #http
      - "3001:3001" #https
    volumes:
      - /path/to/config:/config
    restart: unless-stopped
```

### docker cli

```bash
docker run -d \
  --name=minecraft-client \
  --device /dev/dri:/dev/dri \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Oslo \
  -e DRINODE=/dev/dri/renderD128
  -e DRI_NODE=/dev/dri/renderD128
  -e AUTO_GPU=true
  -p 3000:3000 \
  -p 3001:3001 \
  -v /path/to/config:/config \
  --restart unless-stopped \
  ghcr.io/lanjelin/minecraft-client-docker:latest
```

Additional environment variables can be found [here](https://github.com/linuxserver/docker-baseimage-selkies#options).
