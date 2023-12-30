# Makefile

APP_DIR = app
PYPROJECT_CONFIG = $(APP_DIR)/pyproject.toml

.DEFAULT_GOAL := help
.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Initialize and/or update local repository

.PHONY: init
init: ## initialize repository after git clone
	@. ./init.sh

.PHONY:	installdeps
installdeps: ## install Python dependencies in the local repository
	@pip-sync app/requirements.txt
	@pip-sync app/requirements-dev.txt
	@pre-commit install
	@pre-commit install --hook-type commit-msg

.PHONY:	genpydeps
genpydeps: ## generate Python dependencies for the local repository
	@pip-compile app/requirements.in
	@pip-compile app/requirements-dev.in

.PHONY: alldeps
alldeps: genpydeps installdeps ## generate and install all dependencies

##@ Formatting

.PHONY:	format-black
format-black: ## black (code formatter)
	@black ./$(APP_DIR)

.PHONY: format-isort
format-isort: ## isort (import formatter)
	@isort --sp ./$(PYPROJECT_CONFIG) ./$(APP_DIR)/

.PHONY: format
format: format-black format-isort ## run all formatters

##@ Linting

.PHONY: lint-black
lint-black: ## black in linting mode
	@black ./$(APP_DIR) --check

.PHONY: lint-isort
lint-isort: ## isort in linting mode
	@isort --sp ./$(PYPROJECT_CONFIG) ./$(APP_DIR)/ --check

.PHONY: lint-flake8
lint-flake8: ## flake8 (linter)
	@flake8 --config=./$(APP_DIR)/.flake8 ./$(APP_DIR)/

.PHONY: lint-mypy
lint-mypy: ## mypy (static-type checker)
	@mypy ./$(APP_DIR)

.PHONY: lint-mypy-report
lint-mypy-report: ## run mypy & create report
	@mypy ./$(APP_DIR) --html-report ./mypy_html

.PHONY: lint
lint: lint-black lint-isort lint-flake8 lint-mypy ## run all linters

##@ Testing

.PHONY: unit-tests
unit-tests: ## run unit-tests with pytest
	@pytest --doctest-modules -c $(PYPROJECT_CONFIG)

.PHONY: unit-tests-cov
unit-tests-cov: ## run unit-tests with pytest and generate coverage (terminal + html)
	@pytest --doctest-modules -c $(PYPROJECT_CONFIG) --cov=app --cov-report term-missing --cov-report=html

.PHONY: unit-tests-cov-fail
unit-tests-cov-fail: ## run unit tests with pytest and generate coverage (terminal + html). Fail if coverage too low & create files for CI.
	@pytest -c $(PYPROJECT_CONFIG) --cov=app --cov-report term-missing --cov-report=html --cov-fail-under=50 --junitxml=pytest.xml | tee pytest-coverage.txt

##@ Documentation

.PHONY: docs-build
docs-build: ## build documentation locally
	@mkdocs build

.PHONY: docs-deploy
docs-deploy: ## build & deploy documentation to "gh-pages" branch
	@mkdocs gh-deploy -m "docs: update documentation" -v --force

.PHONY: docs-serve
docs-serve: ## run local server to  view docs locally
	@mkdocs serve

##@ Releases

.PHONY: next-version
next-version: ## returns the next version that will be applied
	@semantic-release --noop --config=$(PYPROJECT_CONFIG) version --print

version: ## generate the next version and creates a release.
	@semantic-release --config=$(PYPROJECT_CONFIG) version

changelog: ## generate changelog
	@semantic-release changelog

publish-noop: ## publish command (no-operation mode)
	@semantic-release --noop publish

##@ Clean-up

clean-cov: ## remove output files from pytest & coverage
	@rm -rf .coverage
	@rm -rf htmlcov
	@rm -rf pytest.xml
	@rm -rf pytest-coverage.txt
	@rm -rf dist
	@rm -rf mypy_html
	@rm -rf .mypy_cache
	@rm -rf $(APP_DIR)/mypy_html
	@rm -rf $(APP_DIR)/.mypy_cache
	@rm -rf $(APP_DIR)/.pytest_cache
	@rm -rf .pytest_cache

clean-docs: ## remove output files from mkdocs
	@rm -rf site

clean: clean-cov clean-docs ## run all clean commands
