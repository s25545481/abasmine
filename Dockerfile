FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=8080

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl wget git screen tar xz-utils \
    openjdk-21-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install MCSManager
RUN mkdir -p /opt/mcsmanager && cd /opt/mcsmanager && \
    wget -q https://cdn.imlazy.ink:233/files/mcsmanager_linux_release.tar.gz -O mcsm.tar.gz && \
    tar -zxf mcsm.tar.gz && \
    mv mcsmanager/* . && rm -rf mcsmanager mcsm.tar.gz

# Install web dependencies
RUN cd /opt/mcsmanager/web && npm install --production

# Install daemon dependencies
RUN cd /opt/mcsmanager/daemon && npm install --production

# Install playit.gg for Minecraft port tunneling
RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg -o /usr/share/keyrings/playit.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/playit.gpg] https://playit-cloud.github.io/ppa/v0 main" \
    > /etc/apt/sources.list.d/playit-cloud.list && \
    apt-get update && apt-get install -y playit && \
    rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
