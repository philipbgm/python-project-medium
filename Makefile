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
	@pytest
unit-tests-cov:
	@pytest --cov=src --cov-report term-missing --cov-report=html
unit-tests-cov-fail:
	@pytest --cov=src --cov-report term-missing --cov-report=html --cov-fail-under=80 --junitxml=pytest.xml | tee pytest-coverage.txt
clean-cov:
	@rm -rf .coverage
	@rm -rf htmlcov
	@rm -rf pytest.xml
	@rm -rf pytest-coverage.txt

format: format-black

lint: lint-black lint-flake8