FROM ubuntu:20.04

# Set DEBIAN_FRONTEND to noninteractive to avoid tzdata prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies including git
RUN apt-get update && apt-get install -y --no-install-recommends \
    qemu-system-x86 \
    novnc \
    websockify \
    wget \
    python3-pip \
    x11vnc \
    xfce4 \
    tzdata \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify git installation by checking the version
RUN git --version

# Upgrade pip and install websockify for noVNC
RUN pip3 install --no-cache-dir --upgrade pip websockify

# Create a working directory
WORKDIR /workspace/vm

# Expose ports for noVNC and VNC
EXPOSE 5900 6969
