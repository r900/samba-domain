FROM ubuntu:bionic

MAINTAINER Fmstrat <fmstrat@NOSPAM.NO>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y pkg-config && \
	apt-get install -y attr acl samba smbclient ldap-utils winbind libnss-winbind libpam-winbind krb5-user krb5-kdc supervisor && \
	apt-get install -y openvpn inetutils-ping && \
	apt-get clean

# Set up script and run
ADD init.sh /init.sh
RUN chmod 755 /init.sh
CMD /init.sh setup
