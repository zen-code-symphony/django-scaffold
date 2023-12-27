# Makefile

APP_DIR = app

init:
	@. ./init.sh

format-black:
	@black ./$(APP_DIR)

format-isort:
	@isort --sp ./$(APP_DIR)/pyproject.toml ./$(APP_DIR)/

lint-black:
	@black ./$(APP_DIR) --check

lint-isort:
	@isort --sp ./$(APP_DIR)/pyproject.toml ./$(APP_DIR)/ --check

lint-flake8:
	@flake8 --config=./$(APP_DIR)/.flake8 ./$(APP_DIR)/

lint-mypy:
	@mypy ./$(APP_DIR)

lint-mypy-report:
	@mypy ./$(APP_DIR) --html-report ./mypy_html

format: format-black format-isort

lint: lint-black lint-isort lint-flake8 lint-mypy
