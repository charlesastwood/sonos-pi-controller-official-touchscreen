FROM debian:buster

# Install the required packages using Python 2.7 versions
#RUN apt-get update && apt-get install -y \
#        libsdl1.2debian \
#        python-pip \
#        python-pygame

# Install the required packages using Python 3 versions
RUN apt-get update && apt-get install -y \
        libsdl2-dev libsdl2-mixer-dev libsdl2-image-dev libsdl2-ttf-dev \
        python3-pip libfreetype6-dev libjpeg-dev libportmidi-dev

# Setup the container environment
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app

# Install Python 2.7 versions of the required Python packages
#RUN pip install -r requirements.txt

# Install Python 3 versions of the required Python packages
RUN pip3 install -r requirements.txt

# Copy the sonos-pi-controller files into the container
COPY . /usr/src/app

# Start the sonos-pi-controller application using Python 2.7
#CMD [ "python", "main.py"]

# Start the sonos-pi-controller application using Python 3
CMD [ "python3", "main.py"]
