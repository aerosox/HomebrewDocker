#	Dockerfile
#	HBServer



FROM	debian:jessy-slim

MAINTAINER	KI7SBI Dylan

RUN	apt-get update && apt-get install -y wget nano supervisor
RUN	wget -O /root/ipscbuild http://ip1.dx40.com/dmrlink/ipscbuild
RUN	chmod 755 /root/ipscbuild
RUN	/root/ipscbuild
#RUN	mkdir -p /var/log/supervisor
COPY	hb-ipsc-supervise.conf /etc/supervisor/conf.d/hb-ipsc-supervise.conf
COPY	hblink.cfg /opt/hblink/hblink.cfg
COPY	HB_Bridge.cfg /opt/hblink/HB_Bridge.cfg
COPY	dmrlink.cfg /top/dmrlink/bridge/dmrlink.cfg
COPY	IPSC_Bridge.cfg /top/dmrlink/bridge/ISPC_Bridge.cfg



EXPOSE	55555


CMD	["/usr/bin/supervisord"]
