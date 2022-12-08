## $ docker build --tag caspiandb/debian-asdf-awscli-postgres --squash .

ARG DEBIAN_ASDF_TAG=latest
ARG VERSION=latest

ARG BUILDDATE
ARG REVISION

FROM caspiandb/debian-asdf:${DEBIAN_ASDF_TAG}

ARG BUILDDATE
ARG REVISION
ARG VERSION

RUN apt-get -q -y update
RUN apt-get -q -y --no-install-recommends install \
  bzip2 git-lfs gnupg groff-base jq openssh-client procps pv xz-utils
RUN apt-get -q -y --no-install-recommends install \
  libreadline8
RUN apt-get -q -y --no-install-recommends install \
  build-essential bison icu-devtools libreadline-dev libssl-dev zlib1g-dev libcurl4-openssl-dev uuid-dev

ADD https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem /usr/local/share/ca-certificates/global-bundle.crt

RUN update-ca-certificates

COPY .tool-versions /root/

ENV POSTGRES_SKIP_INITDB=yes

RUN while read -r plugin _version; do test -d ~/.asdf/plugins/"$plugin" || asdf plugin add "$plugin"; done < .tool-versions
RUN asdf install

RUN apt-get -q -y remove \
  build-essential bison icu-devtools libreadline-dev libssl-dev zlib1g-dev libcurl4-openssl-dev uuid-dev
RUN apt-get -q -y autoremove
RUN find /var/cache/apt /var/lib/apt/lists /var/log -type f -delete

RUN asdf list

LABEL \
  maintainer="CaspianDB <info@caspiandb.com>" \
  org.opencontainers.image.created=${BUILDDATE} \
  org.opencontainers.image.description="Container image with AWS CLI and PostgreSQL" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.revision=${REVISION} \
  org.opencontainers.image.source=https://github.com/CaspianDB/docker-debian-asdf-awscli-postgres \
  org.opencontainers.image.title=debian-asdf-awscli-postgres \
  org.opencontainers.image.url=https://github.com/CaspianDB/docker-debian-asdf-awscli-postgres \
  org.opencontainers.image.vendor=CaspianDB \
  org.opencontainers.image.version=${VERSION}
