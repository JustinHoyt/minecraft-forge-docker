minecraft-forge-docker
======================

A docker container for a minecraft forge server.

```
docker build -t minecraft-forge
docker run -d \
    -p 25565:25565 \
    -v world:/mc/world \
    -t justinhoyt/minecraft-forge-docker
```
