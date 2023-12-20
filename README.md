# django-scaffold

The objective of this project is to provide a quick scaffold for a django project that can be used as a reference for your own project.

## Follow the below steps to get up and running:

NOTE: It assumes that you have installed Python and configured git. If you are using pyenv, `.python-version` file will be used.

```sh
$ git clone git@github.com:zen-code-symphony/django-scaffold.git
$ cd django-scaffold
$ python -m venv venv
$ source venv/bin/activate
$ python -m pip install --upgrade pip
$ python -m pip install -r requirements.txt
# Test the dev server.
$ python manage.py migrate
$ python manage.py runserver
```