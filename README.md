# Simple dnsmasq Server

Simple dnsmasq server based on alpine linux.

This container runs dnsmasq and allows for updating the config file and/or passing in command line arguments.

## To run a server

The basic format is:

```
docker run -d \
--name dns \
--cap-add NET_ADMIN \
--net=host \
neiltheblue/simplednsmasqserver \
<options>
```

## Options

The `NET_ADMIN` and `--net=host` allow for admin access to the network and binding to the host network. The options are any of the dnsmasq command line options:

```
docker run -ti neiltheblue/simplednsmasqserver --help
```

The options may also include entries with the prefix `CONF+<value>` or `CONF-<value>`. These values will be either added or removed from the `/etc/dnsmasq.conf` file. For example to add the `enable-tftp` config option:

```
docker run -d \
--name dns \
--cap-add NET_ADMIN \
--net=host \
neiltheblue/simplednsmasqserver \
CONF+enable-tftp
<options>
```
