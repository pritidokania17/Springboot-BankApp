#####Stage1#############
FROM maven:3.8.3 as builder
WORKDIR /app
COPY . /app
RUN mvn clean install  -DskipTests
########Stage2#############
FROM openjdk:17-alpine
COPY --from=builder /app/target/*.jar /app/target/bank.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/target/bank.jar"]
