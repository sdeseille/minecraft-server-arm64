# minecraft-server-arm64

Dockerized Minecraft server for ARM64. Image is designed to run on Aarch64 compatible SoC like Raspberry Pi 3, Odroid C2, etc. Based on [minecraft-server][0] and [docker-minecraft][1]. 

## Installing docker

Installing docker on ARM can be tricky, follow this guides for [Raspberry Pi 3][2], [Odroid C2][3].

## Building the image

First, you need to build docker image with Minecraft server, pull it from official Docker Hub [minecraft-server-arm64][4]:

```
docker pull eqw3rty/minecraft-server-arm64
```

Also you can build the image from Dockerfile:

```
git clone git@github.com:eqw3rty/minecraft-server-arm64.git
cd minecraft-server-arm64
docker build -t eqw3rty/minecraft-server-arm64 .
```

You may also want to change Minecraft server url in Dockerfile to switch to another version or tune JVM memory params in start script.  

## Running minecraft-server-arm64

To run the container simply use:
```
docker run --name mc -d -p 25565:25565 eqw3rty/minecraft-server-arm64
```

You can mount a host directory as a data volume. This commands mounts the host folder `wolrd` into the container `/opt/minecraft/world`. 

```
docker run --name mc -d -p 25565:25565 -v /home/eqw3rty/world:/opt/minecraft/world eqw3rty/minecraft-server-arm64 
```

To display container logs:

```
docker logs -f mc
```

To start/stop/remove container use following commands:

```
docker start mc
docker stop mc
docker rm mc
```

[0]: https://github.com/itzg/dockerfiles/tree/master/minecraft-server 
[1]: https://github.com/overshard/docker-minecraft
[2]: http://blog.hypriot.com/post/run-docker-rpi3-with-wifi/ 
[3]: http://sankarpanneerselvam.com/2016/04/03/docker-install-on-odroid-c2/
[4]: https://hub.docker.com/r/eqw3rty/minecraft-server-arm64/
