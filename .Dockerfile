FROM ubuntu:20.04

# Set DEBIAN_FRONTEND to noninteractive to avoid tzdata prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies including git
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    novnc \
    websockify \
    wget \
    python3-pip \
    x11vnc \
    xfce4 \
    tzdata \
    git \
    && apt-get clean

# Verify git installation by checking the version
RUN git --version

# Install websockify for noVNC
RUN pip3 install --upgrade websockify

# Create a working directory
RUN mkdir -p /workspace/vm
WORKDIR /workspace/vm
