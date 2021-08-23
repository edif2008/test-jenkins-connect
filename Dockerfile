FROM alpine as download

RUN apk add curl unzip

ENV ARCH amd64
ENV OP_CLI_VERSION v2-alpha1

RUN curl -sSfo op.zip https://bucket.agilebits.com/cli-private-beta/v2/op_linux_${ARCH}_${OP_CLI_VERSION}.zip \
  && unzip -od /usr/local/bin/ op.zip \
  && rm op.zip

FROM docker/compose:alpine-1.29.2

RUN apk add libc6-compat
COPY --from=download /usr/local/bin/op /usr/local/bin/op

COPY /deploy /deploy
WORKDIR /deploy
RUN docker-compose up -d

