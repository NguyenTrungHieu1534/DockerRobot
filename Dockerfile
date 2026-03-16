#Phase 1: Build the application
FROM maven:3.9.11-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

#Phase 2: Run the application
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080

#Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]