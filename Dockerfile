# Base image
FROM docker:25-git

# System, Python, pip and SSH
RUN apk update \
 && apk add --no-cache \
      git \
      zip \
      openssh-client \
      python3 \
      py3-pip \
 && ln -sf /usr/bin/python3 /usr/bin/python \
 && ln -sf /usr/bin/pip3 /usr/bin/pip

WORKDIR /application

# Copy requirements first (to improve cache)
ADD requirements.txt /application/

# Create a virtualenv and install the app's dependencies in it
RUN python3 -m venv /venv \
 && . /venv/bin/activate \
 && pip install --no-cache-dir -r requirements.txt

# Use the venv in the next commands
ENV PATH="/venv/bin:$PATH"