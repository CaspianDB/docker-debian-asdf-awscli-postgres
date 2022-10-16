# debian-asdf-awscli-postgres

[![GitHub](https://img.shields.io/github/v/tag/caspiandb/docker-debian-asdf-awscli-postgres?label=GitHub)](https://github.com/caspiandb/docker-debian-asdf-awscli-postgres)
[![CI](https://github.com/caspiandb/docker-debian-asdf-awscli-postgres/actions/workflows/ci.yaml/badge.svg)](https://github.com/caspiandb/docker-debian-asdf-awscli-postgres/actions/workflows/ci.yaml)
[![Lint](https://github.com/caspiandb/docker-debian-asdf-awscli-postgres/actions/workflows/lint.yaml/badge.svg)](https://github.com/caspiandb/docker-debian-asdf-awscli-postgres/actions/workflows/lint.yaml)
[![Docker Image Version](https://img.shields.io/docker/v/caspiandb/debian-asdf-awscli-postgres/latest?label=docker&logo=docker)](https://hub.docker.com/r/caspiandb/debian-asdf-awscli-postgres)

Container image with:

- [aws-cli](https://github.com/aws/aws-cli)
- [PostgreSQL](https://github.com/postgres/postgres)

Additional Debian packages:

- [bzip2](https://packages.debian.org/bullseye/bzip2)
- [groff-base](https://packages.debian.org/bullseye/groff-base)
- [jq](https://packages.debian.org/bullseye/jq)
- [pv](https://packages.debian.org/bullseye/pv)
- [xz-utils](https://packages.debian.org/bullseye/xz-utils)

## Tags

- `bullseye-YYYYmmdd-awscli-X.Y.Z-postgres-X.Y`, `latest`

## Usage

CLI:

```shell
docker pull caspiandb/debian-asdf-awscli-postgres
docker run -v ~/.aws:/root/.aws -e AWS_PROFILE caspiandb/debian-asdf-awscli-postgres aws sts get-caller-identity
```

Dockerfile:

```Dockerfile
FROM caspiandb/debian-asdf-awscli-postgres:latest
RUN aws --version
RUN psql --version
```

## License

[License information](https://github.com/asdf-vm/asdf/blob/master/LICENSE) for
[asdf](https://asdf-vm.com/) project.

[License information](https://github.com/aws/aws-cli/blob/develop/LICENSE.txt)
for [aws-cli](https://github.com/aws/aws-cli) project.

[License
information](https://github.com/postgres/postgres/blob/master/COPYRIGHT) for
[PostgreSQL](https://github.com/postgres/postgres) project.

[License
information](https://github.com/caspiandb/docker-debian-asdf-awscli-postgres/blob/main/LICENSE) for
container image project.
