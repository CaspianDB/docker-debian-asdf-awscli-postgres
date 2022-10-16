## $ docker build --tag caspiandb/debian-asdf-awscli-postgres --squash .

ARG DEBIAN_ASDF_TAG=latest

FROM caspiandb/debian-asdf:${DEBIAN_ASDF_TAG}

COPY .tool-versions /root/

RUN apt-get -q -y update
RUN apt-get -q -y --no-install-recommends install \
  bzip2 jq pv groff-base xz-utils
RUN apt-get -q -y --no-install-recommends install \
  libreadline8
RUN apt-get -q -y --no-install-recommends install \
  build-essential libreadline-dev libssl-dev zlib1g-dev libcurl4-openssl-dev uuid-dev

ADD https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem /usr/local/share/ca-certificates/global-bundle.crt

RUN update-ca-certificates

ENV POSTGRES_SKIP_INITDB=yes

RUN while read -r plugin _version; do asdf plugin add "$plugin"; done < .tool-versions
RUN asdf install

RUN apt-get -q -y remove \
  build-essential libreadline-dev libssl-dev zlib1g-dev libcurl4-openssl-dev uuid-dev
RUN apt-get -q -y autoremove
RUN find /var/cache/apt /var/lib/apt/lists /var/log -type f -delete

RUN asdf list
