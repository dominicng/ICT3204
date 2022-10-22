FROM fauria/lamp

RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server
RUN apt-get install -y netcat-traditional
RUN apt-get -y install cron
RUN apt-get --assume-yes install rsyslog

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN echo 'test:test' | chpasswd
RUN service ssh start
RUN service apache2 start  


RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.4.3-amd64.deb
RUN sudo dpkg -i filebeat-8.4.3-amd64.deb
COPY ["filebeat.yml", "/etc/filebeat/filebeat.yml"]
# COPY ["apache.yml", "/etc/filebeat/modules.d/apache.yml"]
RUN chmod 0744 /etc/filebeat/filebeat.yml
RUN chmod 0777 /var/log/apache2/*.log
RUN echo "LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\" %{ms}T %p %{Host}i" vhost_combined" >> /etc/apache2/apache2.conf
RUN filebeat modules enable apache


EXPOSE 22
EXPOSE 80

# CMD ["/usr/sbin/sshd","-D"]
# CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
CMD service ssh start && service apache2 start && service rsyslog start && tail -F /dev/null