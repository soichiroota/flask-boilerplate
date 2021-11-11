FROM python:3.9-buster
ADD . /opt/app
WORKDIR /opt/app

RUN pip3 install poetry
COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.path ".venv"
RUN poetry config virtualenvs.in-project true
RUN poetry install --no-dev

CMD ["poetry", "run", "python", "app.py"]
