FROM alpine:3.9

ARG NAME
ARG VERSION
ARG REVISION
ARG CREATED

ARG SOURCE=https://github.com/fnichol/docker-vint.git

LABEL \
  name="$NAME" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.authors="Fletcher Nichol <fnichol@nichol.ca>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="$SOURCE" \
  org.opencontainers.image.revision="$REVISION" \
  org.opencontainers.image.created="$CREATED"

# hadolint ignore=DL3018,DL3013
RUN apk add --no-cache py-pip \
  && pip install --no-cache-dir --compile \
    --no-binary vim-vint "vim-vint==$VERSION" \
  && echo "name=$NAME" > /etc/image-metadata \
  && echo "version=$VERSION" >> /etc/image-metadata \
  && echo "source=$SOURCE" >> /etc/image-metadata \
  && echo "revision=$REVISION" >> /etc/image-metadata \
  && echo "created=$CREATED" >> /etc/image-metadata

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/vint"]
