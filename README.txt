mkdir /jenkins
cd /jenkins
curl -O http://172.18.0.2:8080/jnlpJars/slave.jar
java -jar slave.jar -jnlpUrl http://172.18.0.2:8080/computer/slave1/slave-agent.jnlp

docker build -t yuji/jenkins_slave .
docker run -it --link jenkins01:jenkins --name jenkins_slave01 yuji/jenkins_slave
