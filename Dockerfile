FROM ghcr.io/homalg-project/gap-docker:latest

# Ensure the following commands run as the root user
USER root

# Install Python3 and venv
RUN apt-get update \
    && apt-get install -y python3 python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a virtual environment and install SymPy
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install sympy

# Set the virtual environment as the default Python environment
ENV VIRTUAL_ENV /opt/venv
ENV PATH /opt/venv/bin:$PATH
