#!/bin/bash

RENAISSANCE_VERSION="0.11.0"
JMX_EXPORTER_VERSION="0.15.0"

for JAVA_VERSION in 8 11 16
do
    for JAVA_JVM in "" "-openj9"
    do
        docker build --build-arg JAVA_VERSION=${JAVA_VERSION} --build-arg JAVA_JVM=${JAVA_JVM}  --build-arg RENAISSANCE_VERSION=${RENAISSANCE_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/renaissance_jmx_exporter:${RENAISSANCE_VERSION}-java${JAVA_VERSION}${JAVA_JVM}" .
        docker push "chiabre/renaissance_jmx_exporter:${RENAISSANCE_VERSION}-java${JAVA_VERSION}${JAVA_JVM}"
    done
done
