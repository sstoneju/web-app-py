FROM python:3.8-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2

# Set environment
ARG ENV
ARG PORT

# Install base
RUN apt-get -y update && apt-get -y install curl
ENV POETRY_HOME="/opt/poetry"
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.2.0
RUN $POETRY_HOME/bin/poetry --version

# Prepare file
COPY run.py .
COPY app ./app
COPY pyproject.toml .
COPY poetry.lock .

# Install dependance
RUN $POETRY_HOME/bin/poetry --no-root install

EXPOSE $PORT

CMD ["$POETRY_HOME/bin/poetry", "run", "python", "gunicorn", "-b", "0.0.0.0:$PORT", "run:app"]