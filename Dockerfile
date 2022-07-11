ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install packages
RUN apk add --no-cache bluez
RUN pip3 install --no-cache-dir paho-mqtt bleak

# set the working directory in the container
WORKDIR /src

# Copy data for add-on
COPY ./src/*.py ./
COPY ./src/*.sh ./
RUN chmod a+x ./run.sh

ENTRYPOINT [ "./run.sh" ]