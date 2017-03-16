FROM djavanargent/alpine-base-mono:latest
MAINTAINER djavanargent

# environment settings
ENV \
  XDG_DATA_HOME="/config" \
  XDG_CONFIG_HOME="/config" \
  BRANCH="1.2.2"

# Install sonarr
RUN \
  mkdir -p /app/sabnzbd && \
  git clone --depth 1 --branch $BRANCH https://github.com/sabnzbd/sabnzbd.git /app/sabnzbd && \
  rm -rf /app/sabnzbd/.git

# add local files
COPY root /

# ports and volumes
VOLUME /config /downloads
EXPOSE 8080 9090
