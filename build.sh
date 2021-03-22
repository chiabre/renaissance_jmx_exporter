#!/bin/bash

JAVA_VERSION="11"
RENAISSANCE_VERSION="0.11.0"
JMX_EXPORTER_VERSION="0.15.0"

docker build --network host --build-arg JAVA_VERSION=${JAVA_VERSION} --build-arg RENAISSANCE_VERSION=${RENAISSANCE_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/renaissance_jmx_exporter:${RENAISSANCE_VERSION}-java${JAVA_VERSION}" .
# docker build  --build-arg JAVA_VERSION=${JAVA_VERSION} --build-arg JAVA_FLAVOR=-hotspot --build-arg RENAISSANCE_VERSION=${RENAISSANCE_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/renaissance_jmx_exporter:${RENAISSANCE_VERSION}-java${JAVA_VERSION}-hotspot" .
# docker build  --build-arg JAVA_VERSION=${JAVA_VERSION} --build-arg JAVA_FLAVOR=-openj9 --build-arg RENAISSANCE_VERSION=${RENAISSANCE_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/renaissance_jmx_exporter:${RENAISSANCE_VERSION}-java${JAVA_VERSION}-openj9" .