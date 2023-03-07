FROM openjdk:latest

ARG OSMOSIS_URL="https://github.com/openstreetmap/osmosis/releases/download/0.48.3/osmosis-0.48.3.tgzz"
ENV OSMOSIS_URL $OSMOSIS_URL

RUN set -x \
  && useradd -ms /bin/bash osmosis \
  && mkdir -p /opt/osmosis \
  && curl -L $OSMOSIS_URL | tar xz -C /opt/osmosis \
  && ln -s /opt/osmosis/bin/osmosis /usr/local/bin/osmosis

USER osmosis
CMD ["osmosis"]