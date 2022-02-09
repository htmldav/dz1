FROM ubuntu:14.04
RUN apt-get -y update
WORKDIR /opt/webapp
COPY app/requirements.txt .
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr requirements.txt
COPY app/ .
EXPOSE 5000
CMD ["python", "app.py"]