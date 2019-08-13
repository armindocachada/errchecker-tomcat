FROM tomcat

# install python
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN pip3 install pyinotify

COPY target/errchecker-bin.tar.gz /root/
COPY docker-artifacts/tomcat_logging.properties /usr/local/tomcat/conf/logging.properties
RUN mkdir /tmp/tomcat-logs

WORKDIR /root
RUN tar xvf /root/errchecker-bin.tar.gz
COPY docker-artifacts/start.sh /root

ENTRYPOINT ["/bin/bash","/root/start.sh"]