FROM python:3.8-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2

# Set environment
ARG ENV
ARG PORT

# Install base
RUN apt-get update -y
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.2.2
RUN echo "export PATH=$HOME/.poetry/bin:$PATH" >> $HOME/.bashrc && . $HOME/.bashrc

# Prepare file
COPY run.py .
COPY app ./app
COPY pyproject.toml .
COPY poetry.lock .

# Install dependance
RUN $HOME/.poetry/bin/poetry install

EXPOSE $PORT

CMD ["$HOME/.poetry/bin/poetry", "run", "python", "gunicorn", "-b", "0.0.0.0:$PORT", "run:app"]