FROM python:3.12.1-slim

# Sets the working directory.
WORKDIR /usr/src/app

# Set environment variables.
# Prevents Python from writing .pyc files.
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr.
ENV PYTHONUNBUFFERED 1

# Install tools.
RUN apt-get update && apt-get install -y netcat-traditional

# Upgrade pip and install dependencies.
RUN pip install --upgrade pip
COPY ./requirements-dev.txt .
RUN pip install -r requirements-dev.txt

# Copy entrypoint.sh script.
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Copy project to working directory.
COPY . .

# Run entrypoint script.
ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
