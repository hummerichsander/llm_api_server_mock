FROM python:3.12-slim

RUN pip install poetry

WORKDIR /app

COPY ./poetry.lock /app
COPY ./pyproject.toml /app

RUN poetry install --no-root

COPY ./llm_api_server_mock /app/llm_api_server_mock

LABEL org.opencontainers.image.source="https://github.com/hummerichsander/llm_api_server_mock"

CMD ["poetry", "run", "fastapi", "run", "llm_api_server_mock/main.py", "--port", "8080"]
