# Simple dnsmasq Server

Simple dnsmasq server based on alpine linux. With easy to setup pxe boot.

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
CONF+dnssec
<options>
```

## PXE boot

PXE boot is already configured for dnsmasq with support for lpxelinux, which allows for images to be booted from http.
To add entries to the `pxelinux.cfg/default` file just provide options with the `PXE+` prefix.
For example, with the ubuntu netboot kernel and initrd image hosted on your local server:

```
docker run -d \
--name dns \
--cap-add NET_ADMIN \
--net=host \
neiltheblue/simplednsmasqserver \
'PXE+LABEL Ubuntu xenial amd64_install' \
'PXE+kernel http://<your_server>/ubuntu/xenial/amd64/linux' \
'PXE+append vga=normal initrd=http://<your_server>/ubuntu/xenial/amd64/initrd.gz  --' 

```
