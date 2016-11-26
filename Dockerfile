FROM centos:6
ENV container docker

ADD ./ansible /ansible
ADD ./entrypoint.sh /

# Update all base packages to keep them fresh
RUN yum -y install wget
RUN wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y epel-release-6-8.noarch.rpm && rm -rf epel-release-6-8.noarch.rpm
RUN yum -y update; yum clean all

# Install initscripts, but turn off all services by default
RUN yum -y install initscripts; yum clean all; rm /etc/rc.d/rc*.d/*

# Disable ttys
RUN mv /etc/init/serial.conf /etc/init/serial.conf.disabled; mv /etc/init/tty.conf /etc/init/tty.conf.disabled; mv /etc/init/start-ttys.conf /etc/init/start-ttys.conf.disabled

RUN yum -y install openssh-server openssh-clients
RUN sed -i 's/#PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
#echo GSSAPIAuthentication no >> /etc/ssh/sshd_config
#sed -i s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g /etc/ssh/sshd_config && #sed -i s/UsePAM.*/UsePAM no/g /etc/ssh/sshd_config
RUN echo 'root:docker.io' | chpasswd
RUN /etc/init.d/sshd start

RUN yum -y install git python-setuptools gcc sudo libffi-devel python-devel openssl-devel ansible
RUN echo "localhost ansible_connection=local" >> /etc/ansible/hosts
CMD bash /entrypoint.sh
