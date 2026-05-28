FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble

LABEL maintainer="lanjelin"
ENV TITLE=Minecraft \
  PIXELFLUX_WAYLAND=true

RUN \
  echo "**** add icon ****" && \
  curl -o \
  /usr/share/selkies/www/icon.png \
  https://img.icons8.com/plasticine/200/minecraft-grass-cube--v2.png && \
  echo "**** update packages ****" && \
  DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:samoilov-lex/labwc && \
  apt-get update && \
  apt-get install -y \
  orca \
  gnome-keyring \
  labwc && \
  echo "**** installing Minecraft ****" && \
  curl -O https://launcher.mojang.com/download/Minecraft.deb && \
  apt install -y ./Minecraft.deb && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm Minecraft.deb && \
  rm -rf \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/*

COPY /root /

EXPOSE 3000 3001

VOLUME /config
