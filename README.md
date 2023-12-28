# django-scaffold

The objective of this project is to provide a quick scaffold for a django project that can be used as a reference for your own project.

[![Pre-commit](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/pre-commit.yml)
[![Linting](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/lint.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/lint.yml)
[![Testing](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/test.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/test.yml)

# Table of Contents
- [Prerequisites](#prerequisites)
  - [Install software](#install-software)
- [Get up and running](#get-up-and-running)
- [Configure VS Code](#configure-vs-code)
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
2. Create virtual environment, activate it, install dependencies, and setup pre-commit hooks.
```sh
make init
```
3. Run the app in dev (*Option 1* below) or prod (*Option 2* below) mode.
    * **[Option 1]** 3.1. Run in development mode by following below instructions:
      * 3.1.1. Build the dev container image(s).
      ```sh
      docker compose build
      ```
      * 3.1.2. Run the container(s).
      ```sh
      docker compose up -d
      ```
      * 3.1.3. Access the app at [http://localhost:8000/](http://localhost:8000/)
    * **[Option 2]** 3.2. Run in production mode by following below instructions:
        * 3.2.1. Build the prod container image(s).
        ```sh
        docker-compose -f docker-compose.prod.yaml build
        ```
        * 3.2.2. Run the container(s).
        ```sh
        docker-compose -f docker-compose.prod.yaml up -d
        ```
        * 3.2.3. Run the migrations and copy static resources.
        ```sh
        docker-compose -f docker-compose.prod.yaml exec web python manage.py migrate --noinput
        ```
        * 3.2.3. Copy static resources.
        ```sh
        docker-compose -f docker-compose.prod.yaml exec web python manage.py collectstatic --no-input --clear
        ```
        * 3.2.3. Access the app at [http://localhost:1337/](http://localhost:1337/)


## Configure VS Code
  * Linting, formatting, and sorting import orders using flake8, black, and isort.
    - As part of workspace extensions recommendations in [.vscode/extensions.json](./.vscode/extensions.json), the following VS Code extensions should be installed:
      - [black](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter)
      - [isort](https://marketplace.visualstudio.com/items?itemName=ms-python.isort)
      - [flake8](https://marketplace.visualstudio.com/items?itemName=ms-python.flake8)
    - Make sure that you are using the workspace settings mentioned in repository file [.vscode/settings.json](./.vscode/settings.json). `CTRL+,` and open `Workspace` settings tab to check.

## Learning resources
* [Black](https://black.readthedocs.io/en/stable/index.html)
* [Docker](https://docs.docker.com/guides/get-started/)
* Flake8
  - [Flake8](https://flake8.pycqa.org/en/latest/index.html)
  - [VSCode-Flake8](https://github.com/microsoft/vscode-flake8)
* [Git](https://git-scm.com/book/en/v2)
* [GitHub Actions](https://docs.github.com/en/actions)
* [Markdown cheat-sheet](https://www.markdownguide.org/cheat-sheet/)
* [mypy](https://mypy.readthedocs.io/en/stable/index.html)
* [pip-tools](https://pip-tools.readthedocs.io/en/latest/)
