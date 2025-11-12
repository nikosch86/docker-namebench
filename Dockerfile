FROM python:2.7-alpine

ENV VERSION 1.3.1

RUN set -x && apk add wget

WORKDIR /namebench
RUN set -x && wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/namebench/namebench-${VERSION}-source.tgz \
  && tar xzf namebench-${VERSION}-source.tgz \
  && rm namebench-${VERSION}-source.tgz \
  && mv namebench-${VERSION}/* . \
  && rm -r namebench-${VERSION}/ \
  && chmod +x namebench.py

ENTRYPOINT ["./namebench.py"]
CMD ["-x"]
