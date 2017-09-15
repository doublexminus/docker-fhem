Image forked from mkunzmann/docker-fhem

# Docker Container for FHEM

Docker image for FHEM based on Debian Jessie

Run Directly:

```
docker run -d \
           -p 8083:8083 \
           doublexminus/xx-fhem
```

It is also possible to move the complete FHEM installation folder outside the container
and mount it. This way it is straighforward to modify the config with an external editor.

```
docker run -d \
           -p 8083:8083 \
           -v /volume/with/fhem:/opt/fhem \
           doublexminus/xx-fhem
```

Example with USB-Devices:
```
docker run -d \
           -p 8083:8083 \
           -privileged
           -v /volume/with/fhem:/opt/fhem 
           doublexminus/xx-fhem
           --device=/dev/ttyUSB0 --device=/dev/ttyUSB1 --device=/dev/ttyUSB2
```

When using the container with the external directory on a Synology Diskstation make sure the
directory has read/write permission for everyone.

## Special Plugins
### LG HOMBOT
Usage: https://fhem.de/commandref.html#HOMBOT

To use the HOMBOT-Plugin, you will need to create the following file
```
/opt/fhem/known-hosts
```
### dash_dhcp (Amazon DashButtons)
Start docker-container with additional Port-Mapping 67 to 6767 so there is no need to handle the IP-Routes with iptables
```
           -p 67:6767
```
Usage within FHEM (replace 00:00:00:00:00:00 aswell as 00-00-00-00-00-00 with the MAC-Address of the DashButton):
```
define DashButton dash_dhcp
attr DashButton allowed 00:00:00:00:00:00
attr DashButton port 6767
attr DashButton room dashbutton

define n_DashButton1 notify DashButton:00-00-00-00-00-00..short IF ([DeinFhemGeraet] eq "on") (set DeinFhemGeraet off) ELSE (set DeinFhemGeraet on)
```

