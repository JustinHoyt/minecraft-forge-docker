# docker run -d -p 25565:25565 -t justinhoyt/minecraft-forge-docker
FROM justinhoyt/minecraft-docker:latest
RUN mkdir -p /mc/mods
WORKDIR /mc
ADD \
  forge-1.12.1-14.22.1.2478-installer.jar \
  forge-1.12.1-14.22.1.2478-universal.jar \
  ./

ADD mods/* /mc/mods/

EXPOSE 25565
RUN ["java", "-jar", "forge-1.12.1-14.22.1.2478-installer.jar","-installServer"]
RUN ["rm","forge-1.12.1-14.22.1.2478-installer.jar"]
RUN ["rm","forge-1.12.1-14.22.1.2478-installer.jar.log"]

CMD ["java", "-jar", "forge-1.12.1-14.22.1.2478-universal.jar","nogui"]
