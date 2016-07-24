FROM aarch64/ubuntu

ENV MINECRAFT_SERVER_URL "https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y apt-utils software-properties-common && \
    apt-add-repository ppa:webupd8team/java && \
    apt-get update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get install -y curl oracle-java8-installer

RUN mkdir /opt/minecraft && \
    curl $MINECRAFT_SERVER_URL -o /opt/minecraft/minecraft_server.jar && \
    echo "eula=true" > /opt/minecraft/eula.txt

WORKDIR /opt/minecraft

ADD start.sh start.sh
RUN chmod +x start.sh

EXPOSE 25565

VOLUME ["/opt/minecraft/world"]

CMD ["./start.sh"]
