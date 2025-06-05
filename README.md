Great! Below is a multi-stage Dockerfile that:

Uses Ubuntu as the build stage (Stage 1)

Uses a Distroless Java image as the final stage (Stage 2)

Compiles a simple Java app like Calculator.java

Assumes everything is in the same directory (i.e., Dockerfile and Calculator.java)
