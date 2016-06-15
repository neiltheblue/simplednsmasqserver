#!/bin/sh

echo "config dnsmasq conf"

CONF_FILE=/etc/dnsmasq.conf
PXE_DIR=/pxeboot/pxelinux.cfg
PXE_FILE=${PXE_DIR}/default
ARGS=""

echo "enable-tftp" >> $CONF_FILE
echo "tftp-root=/pxeboot" >> $CONF_FILE
echo "dhcp-boot=lpxelinux.0" >> $CONF_FILE

mkdir -p $PXE_DIR

echo "UI vesamenu.c32" >> $PXE_FILE
echo "TIMEOUT 300">> $PXE_FILE

while [ "$1" ]
do
  case $1 in
    PXE+*) echo "${1}" | sed -e 's/^PXE+//' >> $PXE_FILE
      ;;
    CONF+*) echo "${1}" | sed -e 's/^CONF+//' >> $CONF_FILE
      ;;
    CONF-*) C=$(echo "${1}" | sed -e 's/^CONF-//'); sed -i -e "/${C}/d" $CONF_FILE
      ;;
    *) ARGS="${ARGS} ${1}"
      ;;
  esac
  shift
done

dnsmasq -k ${ARGS}


