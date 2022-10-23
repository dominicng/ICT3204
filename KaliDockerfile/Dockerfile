FROM kalilinux/kali-rolling

RUN apt-get update
RUN apt-get install -y net-tools
RUN apt-get install iputils-ping -y
RUN apt-get --assume-yes install nano
RUN apt-get --assume-yes install python3
RUN apt-get --assume-yes install python3-pip
RUN apt-get install -y netcat-traditional
RUN pip install requests
ENTRYPOINT ["tail", "-f", "/dev/null"]
