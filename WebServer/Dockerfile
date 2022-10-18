FROM fauria/lamp

RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN echo 'test:test' | chpasswd
RUN service ssh start
RUN service apache2 start  

EXPOSE 22
EXPOSE 80

# CMD ["/usr/sbin/sshd","-D"]
# CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
CMD service ssh start && service apache2 start && tail -F /var/log/mysql/error.log