FROM index.alauda.cn/yayu/centos6-i386:latest
MAINTAINER gpf4 64307297@qq.com

# Install packages
#RUN yum install openssh-server
RUN service sshd start
#Change 163 mirrors
ADD sources.list /etc/apt/sources.list


ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**
ENV ROOT_PASS **RANDOM**

VOLUME ["/home"]

EXPOSE 22 80 3306

CMD ["/run.sh"]
