FROM alpine as download

RUN apk add curl unzip

ENV ARCH amd64
ENV OP_CLI_VERSION v2-alpha2

RUN curl -sSfo op.zip https://bucket.agilebits.com/cli-private-beta/v2/op_linux_${ARCH}_${OP_CLI_VERSION}.zip \
  && unzip -od /usr/local/bin/ op.zip \
  && rm op.zip

FROM alpine

RUN addgroup -S opgroup && adduser -S opuser -G opgroup

RUN apk add libc6-compat sed openssl
COPY --from=download /usr/local/bin/op /usr/local/bin/op

USER opuser
