```dockerfile
FROM clojure:temurin-17-lein AS builder

WORKDIR /app

COPY . .

RUN lein deps
RUN lein uberjar

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=builder /app/target/uberjar/*-standalone.jar app.jar

EXPOSE 3000

CMD ["java", "-jar", "app.jar"]
```
