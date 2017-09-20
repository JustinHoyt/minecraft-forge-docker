# docker run -d -p 25565:25565 -t justinhoyt/minecraft-forge-docker
FROM justinhoyt/minecraft-docker
RUN mkdir -p /mc/mods
WORKDIR /mc
ADD \
  forge-1.12-14.21.1.2387-installer.jar \
  forge-1.12-14.21.1.2387-universal.jar \
  ./

ADD mods/* /mc/mods/

EXPOSE 25565
RUN ["java", "-jar", "forge-1.12-14.21.1.2387-installer.jar","-installServer"]
RUN ["rm","forge-1.12-14.21.1.2387-installer.jar"]
RUN ["rm","forge-1.12-14.21.1.2387-installer.jar.log"]

CMD ["java", "-jar", "forge-1.12-14.21.1.2387-universal.jar","nogui"]
