# Ubuntu is a base image for this one
FROM ubuntu:20.04

# Disable interactive input
ENV DEBIAN_FRONTEND=noninteractive

# Get packages to build C++ source code
RUN apt update && apt install -y build-essential cmake

# Copy to Docker Image
COPY . . 

# Build sources
RUN mkdir build && cd build
RUN cmake ../
RUN cmake --build .

# Set working directory
WORKDIR /build 

# Run app
CMD ["/hello_world"]