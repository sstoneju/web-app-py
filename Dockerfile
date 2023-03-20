# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster
LABEL Name="Python Flask Demo App" Version=1.4.2

# Get args
ARG ENV
ARG PORT

# Set environment
ENV ENV=${ENV}
ENV PORT=${PORT}

# Install base
RUN apt-get -y update

# Prepare file
COPY run.py .
COPY app ./app
COPY requirements.txt .

# Install package
RUN pip3 install -r requirements.txt

EXPOSE $PORT

CMD [ "python3", "run.py"]
