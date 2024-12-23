# Makefile
format-black:
	@black .

lint-black:
	@black . --check

lint-flake8:
	@flake8 .

format: format-black

lint: lint-black lint-flake8