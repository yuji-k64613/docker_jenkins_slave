#!/bin/bash
grep '^trap' ~/.bashrc > /dev/null
if [ $? -ne 0 ]; then
cat << EOF >> ~/.bashrc
trap ': stop; sleep 3; exit 0' TERM
EOF
fi

HOME=/jenkins
SLAVE=${HOME}/slave.jar

if [ ! -d ${HOME} ]; then
	mkdir ${HOME}
fi
cd ${HOME}
if [ ! -f ${SLAVE} ]; then
	curl -O http://${JENKINS_PORT_8080_TCP_ADDR}:8080/jnlpJars/slave.jar
fi
exec java -jar slave.jar -jnlpUrl http://${JENKINS_PORT_8080_TCP_ADDR}:8080/computer/slave1/slave-agent.jnlp
