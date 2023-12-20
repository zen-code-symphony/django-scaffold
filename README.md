# django-scaffold

The objective of this project is to provide a quick scaffold for a django project that can be used as a reference for your own project.


# Table of Contents
- [Prerequisites](#prerequisites)
  - [Install software](#install-software)
- [Get up and running](#get-up-and-running)


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
python -m venv venv && source venv/bin/activate
```
3. Upgrade pip and install the Python dependencies.
```sh
python -m pip install --upgrade pip && python -m pip install -r requirements.txt
```
4. Run migrations.
```sh
python manage.py migrate
```
5. Run the dev server.
```sh
python manage.py runserver
```

## Learning resources
* [Docker](https://docs.docker.com/guides/get-started/)
* [Git](https://git-scm.com/book/en/v2)
* [Markdown cheat-sheet](https://www.markdownguide.org/cheat-sheet/)
