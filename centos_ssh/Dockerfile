FROM centos:8.3.2011


RUN yum update -y && \
    yum -y install python3 sudo 
RUN dnf -y update \
    && dnf -y install openssh-server

RUN yum install -y passwd 

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

RUN /usr/bin/ssh-keygen -A


RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
  && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && touch /root/.Xauthority \
  && true


## Set a default user. Available via runtime flag `--user docker`
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory, but also be able to sudo
RUN useradd docker \
        && passwd -d docker \
        && mkdir -p /home/docker \
	&& groupadd staff \
	&& groupadd sudo \
        && chown docker:docker /home/docker \
        && usermod -aG staff docker\
        && usermod -aG sudo docker\
        && true

EXPOSE 22
CMD ["/run.sh"]
