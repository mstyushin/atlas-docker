FROM ubuntu:16.04

ARG ATLAS_VERSION=release-1.1.0-rc2
ARG MAVEN_VERSION=apache-maven-3.6.2

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV MAVEN_HOME /opt/maven/default
ENV MANAGE_LOCAL_SOLR true
ENV MANAGE_LOCAL_HBASE true

ENV PATH /atlas-distr/bin:/opt/maven/default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && apt-get install -qq -y --no-install-recommends git python openjdk-8-jdk wget && \
    mkdir -p /opt/maven && \
    cd /opt/maven && \
    wget -q "http://mirror.linux-ia64.org/apache/maven/maven-3/3.6.2/binaries/${MAVEN_VERSION}-bin.tar.gz" && \
    tar xzf /opt/maven/${MAVEN_VERSION}-bin.tar.gz && \
    ln -s /opt/maven/${MAVEN_VERSION} /opt/maven/default && \
    rm -f /opt/maven/${MAVEN_VERSION}-bin.tar.gz && \
    /opt/maven/default/bin/mvn --version && \
    cd / && \
    git clone https://github.com/apache/atlas.git && \
    cd atlas && \
    git checkout tags/${ATLAS_VERSION} && \
    mvn clean package -Drat.skip -DskipTests -Pdist,embedded-hbase-solr && \
    mkdir -p /atlas-distr && \
    tar xzf /atlas/distro/target/*bin.tar.gz --strip-components 1 -C /atlas-distr && \
    rm -rf /atlas && rm -rf /root/.m2

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

