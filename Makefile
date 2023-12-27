# Makefile

format-black:
	@black ./app

format-isort:
	@isort --sp app/pyproject.toml app/

lint-black:
	@black ./app --check

lint-isort:
	@isort --sp app/pyproject.toml app/ --check

lint-flake8:
	@flake8 --config=./app/.flake8 app/

lint-mypy:
	@mypy ./app

lint-mypy-report:
	@mypy ./app --html-report ./mypy_html

format: format-black format-isort

lint: lint-black lint-isort lint-flake8 lint-mypy
