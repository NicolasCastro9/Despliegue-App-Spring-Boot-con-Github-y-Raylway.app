
FROM gradle:jdk17 as builder
WORKDIR /app


COPY . .


RUN gradle bootJar --no-daemon


FROM openjdk:17-jdk-alpine
WORKDIR /app


COPY --from=builder /app/build/libs/*.jar app.jar


EXPOSE 8080


ENTRYPOINT ["java", "-jar", "app.jar"]
