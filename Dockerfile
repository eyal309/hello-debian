FROM debian:bookworm

RUN apt-get update && apt-get install -y build-essential dh-make debhelper
RUN useradd -ms /bin/bash -u 1001 jenkins

RUN chown jenkins:jenkins /home/jenkins

USER jenkins
WORKDIR /home/jenkins

CMD cat
