# docker run -d -p 25565:25565 -t justinhoyt/minecraft-forge-docker
FROM justinhoyt/minecraft-docker
RUN mkdir -p /mc/mods
WORKDIR /mc
ADD \
  http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2185/forge-1.10.2-12.18.3.2185-installer.jar \
  http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2185/forge-1.10.2-12.18.3.2185-universal.jar \
  ./

ADD mods/* /mc/mods/

EXPOSE 25565
RUN ["java", "-jar", "forge-1.10.2-12.18.3.2185-installer.jar","-installServer"]
RUN ["rm","forge-1.10.2-12.18.3.2185-installer.jar"]
RUN ["rm","forge-1.10.2-12.18.3.2185-installer.jar.log"]

CMD ["java", "-jar", "forge-1.10.2-12.18.3.2185-universal.jar","nogui"]
