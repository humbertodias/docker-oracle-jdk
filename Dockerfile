FROM debian
MAINTAINER Humberto Dias

# Install
RUN apt update && apt install -y curl ca-certificates tar gzip make

# Java Version
ARG JAVA_VERSION_MAJOR
ARG JAVA_VERSION_MINOR
ARG JAVA_VERSION_BUILD
ARG JAVA_HASH
ARG JAVA_PACKAGE
ARG JAVA_ARCH

ENV JAVA_JDK_URL https://download.oracle.com/otn-pub/java/${JAVA_PACKAGE}/${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR}+${JAVA_VERSION_BUILD}/${JAVA_HASH}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR}_linux-${JAVA_ARCH}_bin.tar.gz

# Download and unarchive Java
RUN echo "Downloading ${JAVA_JDK_URL}" && \
  curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" ${JAVA_JDK_URL}\
    | tar -xzf - -C /opt &&\
    ln -s /opt/jdk-${JAVA_VERSION_MAJOR}.0.${JAVA_VERSION_MINOR} /opt/jdk &&\
    rm -rf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/lib/plugin.jar \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so

# Set environment
ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

# Add user
RUN useradd -m java
RUN echo "java:java" | chpasswd

# Workdir
USER java
WORKDIR /home/java