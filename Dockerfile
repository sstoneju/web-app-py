FROM python:3.8-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2

# Set environment
ARG ENV
ARG PORT

# Install base
RUN apt-get -y update && apt-get -y install curl
ENV POETRY_HOME="/opt/poetry"
ENV PORTS=$PORT
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.2.0
RUN $POETRY_HOME/bin/poetry --version
RUN export PATH=$PATH:$POETRY_HOME

# Prepare file
COPY run.py .
COPY app ./app
COPY pyproject.toml .
COPY poetry.lock .

# Install dependance
RUN $POETRY_HOME/bin/poetry --no-root install
RUN $POETRY_HOME/bin/poetry env use 3.8

EXPOSE $PORTS

CMD ["gunicorn", "-b", "0.0.0.0:$PORTS", "run:app"]

## poetry는 개발할 떄 사용하고, docker build 할 때는 venv를 사용하는게 좋겠다.