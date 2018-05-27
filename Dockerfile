# Base image
FROM docker:git

# Base dependencies
RUN apk add --no-cache \
    git \
    openssh \
    zip

# Python
RUN apk add --no-cache python3 \
  && python3 -m ensurepip \
  && rm -r /usr/lib/python*/ensurepip \
  && pip3 install --upgrade pip setuptools \
  && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip; fi \
  && if [ ! -e /usr/bin/pydoc ]; then ln -s pydoc3 /usr/bin/pydoc; fi \
  && if [ ! -e /usr/bin/python ]; then ln -s python3 /usr/bin/python; fi \
  && rm -r /root/.cache \
  && cd /usr/local/bin

# AWS CLI
RUN pip install --upgrade awscli

# Docker
RUN pip install --upgrade docker
