FROM debian:buster

### libsdl 1.2 included in Debian Buster has issues with the touch screen.
### Force libsdl 1.2 from Debian Wheezy

# Enable Wheezy package sources
RUN echo "deb http://archive.debian.org/debian/ wheezy main" > /etc/apt/sources.list.d/wheezy.list

# Allow only libsdl1.2debian from Wheezy
RUN printf "Package: *\n\
Pin: release n=wheezy\n\
Pin-Priority: 1\n\
\n\
Package: libsdl1.2debian\n\
Pin: release n=wheezy\n\
Pin-Priority: 900\n\
" > /etc/apt/preferences.d/libsdl
###

# Install the required packages using Python 2.7 versions
#RUN apt-get update && apt-get install -y \
#        libsdl1.2debian \
#        python-pip \
#        python-pygame

# Install the required packages using Python 3 versions
RUN apt-get update && apt-get install -y \
        libsdl1.2debian \
        python3-pip \
        python3-pygame

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
