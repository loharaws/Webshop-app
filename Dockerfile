# Base image
FROM clojure:temurin-17-lein

# Working directory
WORKDIR /app

# Copy project files
COPY . .

# Download dependencies
RUN lein deps

# Run tests
RUN lein test

# Build uberjar
RUN lein uberjar

# Expose application port
EXPOSE 3000

# Run application
CMD ["java", "-jar", "target/uberjar/webshop-standalone.jar"]
