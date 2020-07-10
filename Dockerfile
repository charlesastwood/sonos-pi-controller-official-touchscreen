FROM rparenton/debian-pygame-base
RUN mkdir -p /usr/src/app
COPY requirements.txt /usr/src/app
WORKDIR /usr/src/app
##RUN pip install -r requirements.txt
RUN pip3 install -r requirements.txt
COPY . /usr/src/app

CMD [ "python3", "main.py"]
