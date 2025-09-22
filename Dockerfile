FROM openjdk:17-jdk-slim

WORKDIR /server

# Скопировать сервер и плагины
COPY . /server

# Принять EULA
RUN echo "eula=true" > eula.txt

EXPOSE 8080

CMD ["java", "-Xmx256M", "-Xms128M", "-jar", "paper-1.12.2.jar", "--nogui", "--port", "8080"]
