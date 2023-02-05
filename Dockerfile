# Ubuntu is a base image for this one

FROM ubuntu:20.04

# Get packages to build C++ source code
RUN apt update
RUN apt install -y build-essential cmake

# Build sources
RUN mkdir build && cd build
RUN cmake ../
RUN cmake --build .

# Run app
CMD ["/build/hello_world"]