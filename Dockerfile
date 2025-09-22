FROM openjdk:17-jdk-slim

WORKDIR /server

# Скачиваем Paper 1.12.2 build 1620
RUN apt-get update && apt-get install -y wget \
 && wget -O paper-1.12.2.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

# Создаем плагины папку и скачиваем ViaVersion
RUN mkdir -p plugins \
 && wget -O plugins/ViaVersion.jar https://ci.viaversion.com/job/ViaVersion/lastSuccessfulBuild/artifact/build/libs/ViaVersion.jar

# Принять EULA
RUN echo "eula=true" > eula.txt

# Настройки
EXPOSE 8080

CMD ["java", "-Xmx512M", "-Xms128M", "-jar", "paper-1.12.2.jar", "--nogui", "--port", "8080"]
