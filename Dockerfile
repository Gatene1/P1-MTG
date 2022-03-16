FROM openjdk
COPY ./build/libs/*-all.jar /app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]