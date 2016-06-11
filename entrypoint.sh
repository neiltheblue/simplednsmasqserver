#!/bin/sh

echo "config dnsmasq conf"

CONF_FILE=/etc/dnsmasq.conf
ARGS=""
for C in $@
do
  case $C in
    CONF+*) echo ${C:5} >> $CONF_FILE
      ;;
    CONF-*) sed -i -e "/${C:5}/d" $CONF_FILE
      ;;
    *) ARGS="${ARGS} $C"
      ;;
  esac
done

dnsmasq -k ${ARGS}
