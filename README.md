# Docker image for GS actuator spring boot demo + JMX to Prometheus exporter

Docker image to run the sping boot demo service GS actuator exposing JMX to Prometheus exporter metrics and java options as env. variables.

* **GS actuator** : a spring boot based demo service to verify if a number is a prime number. https://github.com/anushiya-thevapalan/springboot-test

* **JMX to Prometheus exporter** : a collector that can configurably scrape and expose mBeans of a JMX target. https://github.com/prometheus/jmx_exporter

* The **version number** of this images is composed of two version numbers
  * the first is the version of GS actuator service
  * the second is the version of JMX to Prometheus exporter embedded in this docker image

## GS actuator spring boot demo + JMX to Prometheus exporter

`chiabre/gs_actuator_jmx_exporter`
* Find Images of this repo on [docker hub](https://hub.docker.com/repository/docker/chiabre/gs_jmx_exporter)
* Find repo of this images on [github](https://github.com/chiabre/gs_jmx_exporter)

In addtion to the GS actuator service features:
* JMX to Prometheus exporter metrics on port 9404
* JVM_OPTS as ENV variable (dafeult JAVA_OPTS="-Xmx512m")

### Supported tags

* GS actuator service 0.1.0 + JMX to Prometheus exporter 0.14
   * `latest`, `0.1.0-0.14.0`

## How to use this image

### Build using

`build.sh`

### Run using

`docker run -d -p 9000:9000 -p 9404:9404 -e JAVA_OPTS="[YOUR JAVA OPTS]" chiabre/gs_actuator_jmx_exporter:0.1.0-0.14.0`

The service will be available at:

http://[GS_ACTUATOR]:9000/prime?number=[NUMBER]

The Prometheus JMX exporter metrics are at:

http://[GS_ACTUATOR]:9404/metrics/

### Docker swarm sample

```dockercompose
version: "3.8"
services:
  konakart:
    image: chiabre/gs_jmx_exporter:latest
    deploy:
      restart_policy:
        condition: none
      resources:
        reservations:
          cpus: '1'
          memory: 1024m
        limits:
          cpus: '1'
          memory: 1024m
    ports:
    - 9000:9000
    - 9404:9404
    environment:
    - JAVA_OPTS="[YOUR JAVA OPTS]"```
