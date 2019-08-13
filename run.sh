docker run --rm -it -v $(pwd):/project -w /project maven mvn package && \
    docker build -t armindocachada/tomcat-container-test . && \
    docker run -p 8080:8080 -ti --rm armindocachada/tomcat-container-test:latest