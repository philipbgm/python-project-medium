# Makefile
format-black:
	@black .

lint-black:
	@black . --check

lint-flake8:
	@flake8 .

lint-mypy:
	@mypy .

unit-tests:
	@pytest --doctest-modules
unit-tests-cov:
	@pytest --doctest-modules --cache-clear --cov=src --cov-report term-missing --cov-report=html
unit-tests-cov-fail:
	@pytest --doctest-modules --cache-clear --cov=src --cov-report term-missing --cov-report=html --cov-fail-under=80 --junitxml=pytest.xml | tee pytest-coverage.txt
clean-cov:
	@rm -rf .coverage
	@rm -rf htmlcov
	@rm -rf pytest.xml
	@rm -rf pytest-coverage.txt


##@ Documentation
docs-build: ## build documentation locally
	@mkdocs build

docs-deploy: ## build & deploy documentation to "gh-pages" branch
	@mkdocs gh-deploy -m "docs: update documentation" -v --force

clean-docs: ## remove output files from mkdocs
	@rm -rf site


format: format-black

lint: lint-black lint-flake8