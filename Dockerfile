# Base image
FROM docker:25.0.5-git

# Base dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    python3-dev \
    libffi-dev \
    openssl-dev \
    build-base \
    py3-setuptools \
    py3-wheel \
    cython

# Python
RUN ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip && \
    pip install --break-system-packages --no-cache-dir --upgrade pip setuptools

# PIP dependencies
WORKDIR /application
COPY requirements.txt /application/
RUN pip install --break-system-packages --no-cache-dir "cython==0.29.36"
RUN pip install --break-system-packages --no-cache-dir --no-build-isolation --requirement requirements.txt
