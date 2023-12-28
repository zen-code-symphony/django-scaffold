# Makefile

APP_DIR = app

.DEFAULT_GOAL := help
.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

init:
	@. ./init.sh

##@ Formatting

.PHONY: format-black
format-black: ## black (code formatter)
	@black ./$(APP_DIR)

.PHONY: format-isort
format-isort: ## isort (import formatter)
	@isort --sp ./$(APP_DIR)/pyproject.toml ./$(APP_DIR)/

.PHONY: format
format: format-black format-isort ## run all formatters

##@ Linting

.PHONY: lint-black
lint-black: ## black in linting mode
	@black ./$(APP_DIR) --check

.PHONY: lint-isort
lint-isort: ## isort in linting mode
	@isort --sp ./$(APP_DIR)/pyproject.toml ./$(APP_DIR)/ --check

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
