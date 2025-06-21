# Multi-stage Dockerfile for Spring Boot app
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
# Create a non-root user and group
RUN groupadd -r spring && useradd -r -g spring springuser

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
RUN chown springuser:spring app.jar

# in a single line 
#COPY --from=build --chown=springuser:spring /app/target/*.jar app.jar

# Switch to the non-root user
USER springuser

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
