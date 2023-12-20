FROM python:3.11.4-slim-buster

# Sets the working directory.
WORKDIR /usr/src/app

# Set environment variables.
# Prevents Python from writing .pyc files.
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr.
ENV PYTHONUNBUFFERED 1

# Upgrade pip and install dependencies.
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy project to working directory.
COPY . .