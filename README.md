# django-scaffold

The objective of this project is to provide a quick scaffold for a django project that can be used as a reference for your own project.


# Table of Contents
- [Prerequisites](#prerequisites)
  - [Install software](#install-software)
- [Get up and running](#get-up-and-running)
- [Learning resources](#learning-resources)


## Prerequisites

### Install software
- [docker](https://docs.docker.com/get-docker/)
- [git](https://git-scm.com/downloads)
- [pyenv - _optional_](https://github.com/pyenv/pyenv)
- [VS Code - _optional_](https://code.visualstudio.com/download)


## Get up and running

Follow the below steps to get up and running. **NOTE**: It assumes that you have installed Python and configured git. If you are using pyenv, `.python-version` file will be used.

1. Clone the repository.
```sh
git clone git@github.com:zen-code-symphony/django-scaffold.git && cd django-scaffold
```
2. Create virtual environment and activate it.
```sh
python -m venv app/venv && source app/venv/bin/activate
```
3. Upgrade pip and install the Python dependencies.
```sh
python -m pip install --upgrade pip && python -m pip install -r app/requirements-dev.txt
```
4. Run the app in dev (*Option 1* below) or prod (*Option 2* below) mode.
    * **[Option 1]** 4.1. Run in development mode by following below instructions:
      * 4.1.1. Build the dev container image(s).
      ```sh
      docker compose build
      ```
      * 4.1.2. Run the container(s).
      ```sh
      docker compose up -d
      ```
      * 4.1.3. Access the app at [http://localhost:8000/](http://localhost:8000/)
    * **[Option 2]** 4.2. Run in production mode by following below instructions:
        * 4.2.1. Build the prod container image(s).
        ```sh
        docker-compose -f docker-compose.prod.yaml build
        ```
        * 4.2.2. Run the container(s).
        ```sh
        docker-compose -f docker-compose.prod.yaml up -d
        ```
        * 4.2.3. Run the migrations and copy static resources.
        ```sh
        docker-compose -f docker-compose.prod.yaml exec web python manage.py migrate --noinput
        ```
        * 4.2.4. Copy static resources.
        ```sh
        docker-compose -f docker-compose.prod.yaml exec web python manage.py collectstatic --no-input --clear
        ```
        * 4.2.5. Access the app at [http://localhost:1337/](http://localhost:1337/)

## Learning resources
* [Docker](https://docs.docker.com/guides/get-started/)
* [Flake8](https://flake8.pycqa.org/en/latest/index.html)
* [Git](https://git-scm.com/book/en/v2)
* [Markdown cheat-sheet](https://www.markdownguide.org/cheat-sheet/)
* [pip-tools](https://pip-tools.readthedocs.io/en/latest/)
