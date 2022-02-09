FROM ubuntu:18.04
RUN apt-get -y update
WORKDIR /opt/webapp
RUN mkdir tmp/
COPY app/requirements.txt ./tmp
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr ./tmp/requirements.txt
COPY app/ .
EXPOSE 5000
CMD ["python", "app.py"]