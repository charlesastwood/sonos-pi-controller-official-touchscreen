FROM debian:buster

# Update apt
RUN apt-get update

# Install Python 2.7 versions of the required Python packages
##RUN apt-get install -y python-pip python-pygame

# Install Python 3 versions of the required Python packages
RUN apt-get install -y python3-pip python3-pygame

# Install SDL 1.2
RUN apt-get install -y libsdl1.2debian

# Setup the container environment
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app

# Install Python 2.7 versions of the required Python packages
##RUN pip install -r requirements.txt

# Install Python 3 versions of the required Python packages
RUN pip3 install -r requirements.txt

# Copy the sonos-pi-controller files into the container
COPY . /usr/src/app

# Start the sonos-pi-controller application
CMD [ "python3", "main.py"]
