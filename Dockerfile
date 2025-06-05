# ---------- Stage 1: Build (Ubuntu) ----------
FROM ubuntu:22.04 AS builder

# Install OpenJDK and other required tools
RUN apt-get update && \
    apt-get install -y openjdk-21-jdk && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy the source file
COPY Calculator.java .

# Compile the Java file
RUN javac Calculator.java

# ---------- Stage 2: Final Runtime (Distroless) ----------
FROM gcr.io/distroless/java21-debian12

# Copy compiled class files from the builder stage
COPY --from=builder /app /app

# Set working directory
WORKDIR /app

# Run the app
ENTRYPOINT ["java", "Calculator"]