# -----------------------------------------------------------------------------
# LAB ONLY - Intentionally Vulnerable Docker Image
# DO NOT USE IN PRODUCTION
# -----------------------------------------------------------------------------

FROM nginx:1.21-alpine

LABEL maintainer="training@example.com"
LABEL application="Trivy Demo"
LABEL purpose="Intentional Vulnerability Demo"

ENV APP_HOME=/usr/share/nginx/html

# Intentionally install older packages and skip upgrades
RUN apk add --no-cache \
    bash \
    curl \
    busybox \
    openssl \
    libssl3 \
    zlib

# Copy website
COPY index.html ${APP_HOME}/
COPY images/ ${APP_HOME}/images/

# Intentionally run as root
USER root

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
