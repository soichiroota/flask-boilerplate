build:
	docker-compose build

update:
	docker-compose run --rm web poetry update

install:
	docker-compose run --rm web poetry install

up:
	docker-compose up

up-build:
	docker-compose up --build

down:
	docker-compose down

test:
	make install
	docker-compose run --rm web poetry run pytest --cov=api tests

lint:
	make install
	docker-compose run --rm web poetry run flake8 tests app.py flask_boilerplate
	docker-compose run --rm web poetry run isort --check --diff tests app.py flask_boilerplate
	docker-compose run --rm web poetry run black --check tests app.py flask_boilerplate
	docker-compose run --rm web poetry run mypy tests app.py flask_boilerplate

format:
	make install
	docker-compose run --rm web poetry run isort tests app.py flask_boilerplate
	docker-compose run --rm web poetry run black tests app.py flask_boilerplate
