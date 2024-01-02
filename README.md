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
  - [PATH 1: Create a copy for your own project](#path-1-create-a-copy-for-your-own-project)
  - [PATH 2: Cloning this repository](#path-2-cloning-this-repository)
  - [Build and run app](#build-and-run-app)
- [Configure VS Code](#configure-vs-code)
- [Learning resources](#learning-resources)


## Prerequisites

### Install software
- [docker](https://docs.docker.com/get-docker/)
- [git](https://git-scm.com/downloads)
- [pyenv - _optional_](https://github.com/pyenv/pyenv)
- [VS Code - _optional_](https://code.visualstudio.com/download)


## Get up and running

Follow one of the below paths to get up and running. **NOTE**: It assumes that you have installed Python and configured git. If you are using pyenv, `.python-version` file will be used.

### PATH 1: Create a copy for your own project

Run the below command to create a project based on this basic scaffold.

**Option 1**: Create new project from Linux or macOS command shell and stay in the shell:
```sh
# Replace "my_project" with your own project name.
curl -sSL https://raw.githubusercontent.com/zen-code-symphony/django-scaffold/main/create-project.sh | bash -s my_project && cd my_project && source app/venv/bin/activate
```

**Option 2**: Create new project from Linux or macOS shell and open VS Code editor:
```sh
# Replace "my_project" with your own project name.
curl -sSL https://raw.githubusercontent.com/zen-code-symphony/django-scaffold/main/create-project.sh | bash -s my_project && cd my_project && code .
```

### PATH 2: Cloning this repository

1. Clone the repository.
```sh
git clone git@github.com:zen-code-symphony/django-scaffold.git && cd django-scaffold
```
2. Create virtual environment, activate it, install dependencies, and setup pre-commit hooks.
```sh
make init
```

### Build and run app
Once you have followed [PATH 1](#path-1-create-a-copy-for-your-own-project) or [PATH 2](#path-2-cloning-this-repository) above, build and run the app in dev (*Option 1* below) or prod (*Option 2* below) mode.
* **[Option 1]** Run in development mode by following below instructions:
  * 1.1 Build and run the dev container image(s).
  ```sh
  make bup-dev
  ```
  * 1.2 Browser will open automatically with the app running at [http://localhost:8000/](http://localhost:8000/)
* **[Option 2]** Run in production mode by following below instructions:
    * 2.1. Build and run the prod container image(s).
    ```sh
    make bup-prod
    ```
    * 2.2. Browser will open automatically with the app running at [http://localhost:1337/](http://localhost:1337/)


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
