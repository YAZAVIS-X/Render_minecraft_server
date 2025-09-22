FROM openjdk:17-jdk-slim

WORKDIR /server

# Скачиваем только Paper 1.12.2 build 1620
RUN apt-get update && apt-get install -y wget \
 && wget -O paper-1.12.2-1620.jar https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

# Создаем папку plugins (твой локальный jar уже там)
RUN mkdir -p plugins

# Принять EULA
RUN echo "eula=true" > eula.txt

EXPOSE 8080

CMD ["java", "-Xmx256M", "-Xms128M", "-jar", "paper-1.12.2-1620.jar", "--nogui", "--port", "8080"]
