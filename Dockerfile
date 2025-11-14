# Base image
FROM docker:25.0.5-git

# Base dependencies
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        openssh \
        zip \
        python3 \
        py3-pip

# Python
RUN ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    pip install --no-cache-dir --upgrade pip setuptools

# PIP dependencies
WORKDIR /application
COPY requirements.txt /application/
RUN pip install --no-cache-dir --requirement requirements.txt
