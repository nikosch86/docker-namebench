FROM python:2.7-slim

ENV VERSION 1.3.1

RUN set -x && apt-get update && apt-get -y install wget --no-install-recommends \
  && apt-get clean && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /namebench
RUN set -x && wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/namebench/namebench-${VERSION}-source.tgz \
  && tar xzf namebench-${VERSION}-source.tgz \
  && rm namebench-${VERSION}-source.tgz \
  && mv namebench-${VERSION}/* . \
  && rm -r namebench-${VERSION}/ \
  && chmod +x namebench.py

ENTRYPOINT ["./namebench.py"]
CMD ["-x"]
