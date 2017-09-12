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
To use the HOMBOT-Plugin, you will need to create the following file
```
/opt/fhem/known-hosts
```
