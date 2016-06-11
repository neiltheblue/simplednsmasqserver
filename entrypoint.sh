#!/bin/sh

echo "config dnsmasq conf"

CONF_FILE=/etc/dnsmasq.conf
ARGS=""

while [ "$1" ]
do
  case $1 in
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


