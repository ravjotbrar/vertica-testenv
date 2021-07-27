FROM centos:7
ENV SBT_VERSION 1.3.13
ENV JAVA_OPTS="$JAVA_OPTS -Djava.security.auth.login.config=/connector/conf/jaas.config"

RUN yum install -y java-11-openjdk && \
    yum install -y epel-release && \
    yum update -y && yum install -y wget && \
    wget http://dl.bintray.com/sbt/rpm/sbt-$SBT_VERSION.rpm && \
    yum install -y sbt-$SBT_VERSION.rpm

RUN yum install -y krb5-workstation
COPY . /sandbox
RUN /sandbox/kerberize.sh
COPY ./vsql /usr/local/bin/vsql
ENTRYPOINT ["/bin/bash"]

