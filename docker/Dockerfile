FROM linuxserver/qbittorrent:version-14.3.9.99202110311443-7435-01519b5e7ubuntu20.04.1

LABEL maintainer=Eleven

MAINTAINER author "Eleven"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root/

ADD .vimrc /root/.vimrc
ADD qbconfig /config
ADD qbstart.sh /root/qbstart.sh

#ARG Requirement='python3.8 python3-pip wget unzip net-tools curl vim' 
ARG Requirement='python3.8 python3-pip wget' 
ARG Delment='wget unzip net-tools curl vim
ARG Delment='wget'
ARG PIPRequirement='flexget autoremove-torrents qbittorrent-api'

RUN	apt update && apt install -y $Requirement \
	&& ln -s /usr/bin/python3.8 /usr/bin/python \
	&& pip install $PIPRequirement \
	&& which flexget && flexget -V \
	&& which pip && pip -V \
	&& mkdir -p /root/logs \
	&& mkdir -p /root/plugins \
	&& wget -O /root/plugins/nexusphp.py https://raw.githubusercontent.com/Juszoe/flexget-nexusphp/master/nexusphp.py  \
	&& rm -rf /var/lib/apt/lists/* && apt clean \
	&& chmod +x /root/qbstart.sh
	
RUN 	apt purge -y $Delment \
	&& apt autoremove -y \
	&& rm -rf /var/lib/apt/lists/* && apt clean
	
# && which flexget

RUN     sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list \
	&& sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list
# RUN apt update
  
ADD pip.conf /root/.pip/pip.conf

EXPOSE 55555 56881
	
#ENTRYPOINT /root/.config/clash/start.sh && tail -f /dev/null
