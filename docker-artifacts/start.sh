#!/bin/bash

nohup /root/errchecker/bin/errchecker &
/usr/local/tomcat/bin/catalina.sh run