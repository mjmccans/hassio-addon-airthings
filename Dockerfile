ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-setuptools \
        build-essential \
        libglib2.0-0 \
        libglib2.0-dev \
    && pip3 install --no-cache-dir paho-mqtt toml bluepy \
    && apt-get remove -y \
        python3-pip \
        python3-setuptools \
        build-essential \
        libglib2.0-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# set the working directory in the container
WORKDIR /src

# Copy data for add-on
COPY ./src/*.py ./
COPY ./src/*.toml ./

#CMD [ "python3", "airthings-mqtt-ha.py" ]
CMD ["/bin/bash", "-c", "sleep infinity"]