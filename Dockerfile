FROM docker:stable

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git bash

COPY Dockerfile.default /Dockerfile
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
