
FROM python:3.12-slim AS builder

WORKDIR /api

RUN pip install --upgrade pip poetry

COPY . /api

RUN poetry install

EXPOSE 8000

CMD ["poetry", "run", "fastapi", "dev", "/api/src/main.py", "--port", "8000","--host","0.0.0.0"]
