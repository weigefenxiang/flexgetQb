FROM linuxserver/qbittorrent:version-14.3.9.99202110311443-7435-01519b5e7ubuntu20.04.1

LABEL maintainer=Eleven

MAINTAINER author "Eleven"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root/

ADD .vimrc /root/.vimrc

ARG Requirement='wget unzip net-tools curl vim python3.8 python-pip' 
ARG Delment='wget unzip'

RUN	apt update && apt install -y $Requirement \
	&& which python3.8 \
	&& which pip \
	&& pip install flexget \
	&& which flexget

RUN     sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
	&& sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
	&& rm -rf /var/lib/apt/lists/* && apt clean
# RUN apt update
  
ADD pip.conf /root/.pip/pip.conf

EXPOSE 55555 56881
	
#ENTRYPOINT /root/.config/clash/start.sh && tail -f /dev/null
