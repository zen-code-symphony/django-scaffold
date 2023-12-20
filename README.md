# django-scaffold

## Follow the below steps to get up and running:

NOTE: It assumes that you have installed Python using pyenv and configured git.

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