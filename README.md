# django-scaffold

The objective of this project is to provide a quick scaffold for a django project that can be used as a reference for your own project.

[![Pre-commit](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/pre-commit.yml)
[![Linting](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/lint.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/lint.yml)
[![Testing](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/test.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/test.yml)
[![Documentation](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/docs-pages.yml/badge.svg)](https://github.com/zen-code-symphony/django-scaffold/actions/workflows/docs-pages.yml)

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
      * 3.1.1. Build and run the dev container image(s).
      ```sh
      make bup-dev
      ```
      * 3.2.2. Browser will open automatically with the app running at [http://localhost:8000/](http://localhost:8000/)
    * **[Option 2]** 3.2. Run in production mode by following below instructions:
        * 3.2.1. Build and run the prod container image(s).
        ```sh
        make bup-prod
        ```
        * 3.2.2. Browser will open automatically with the app running at [http://localhost:1337/](http://localhost:1337/)


## Configure VS Code
  - As part of VS Code workspace extensions recommendations, the extensions mentioned in [.vscode/extensions.json](./.vscode/extensions.json), should be installed. This includes extensions for flake8, black, isort etc.
  - Make sure that you are using the workspace settings mentioned in repository file [.vscode/settings.json](./.vscode/settings.json). `CTRL+,` and open `Workspace` settings tab to check.

## References
* [Black](https://black.readthedocs.io/en/stable/index.html)
* [Conventional Commits](https://www.conventionalcommits.org/)
* [djangoproject.com](https://www.djangoproject.com/)
* [diataxis](https://diataxis.fr/)
* [docs.docker.com](https://docs.docker.com/)
* Flake8
  - [Flake8](https://flake8.pycqa.org/en/latest/index.html)
  - [VSCode-Flake8](https://github.com/microsoft/vscode-flake8)
* [Git](https://git-scm.com/book/en/v2)
* [GitHub Actions](https://docs.github.com/en/actions)
* [Markdown cheat-sheet](https://www.markdownguide.org/cheat-sheet/)
* [MkDocs](https://www.mkdocs.org/)
* [mypy](https://mypy.readthedocs.io/en/stable/index.html)
* [pip-tools](https://pip-tools.readthedocs.io/en/latest/)
* [Python best practices for a new project ](https://mitelman.engineering/blog/python-best-practice/automating-python-best-practices-for-a-new-project/)
* [realpython.com](https://realpython.com/)
* [Semantic Versioning](https://semver.org/)
* [Setting up Python projects](https://towardsdatascience.com/setting-up-python-projects-part-i-408603868c08)
* [stackoverflow.com](https://stackoverflow.com/)
* [testdriven.io](https://testdriven.io/)
