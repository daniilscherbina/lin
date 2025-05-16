FROM python:3.10-slim as base-builder

WORKDIR /app

COPY pyproject.toml ./
COPY src ./src

RUN pip install --upgrade pip \
    && pip install .



FROM base-builder as test-builder

COPY tests ./tests

RUN pip install .[test]




FROM python:3.9-slim as test

WORKDIR /app

COPY --from=test-builder /usr/local/lib /usr/local/lib
COPY --from=test-builder /app/src ./src
COPY --from=test-builder /app/tests ./tests

ENV PYTHONPATH=/app

EXPOSE 8083
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8083"]



FROM python:3.9-slim as production

WORKDIR /app

COPY --from=base-builder /usr/local/lib /usr/local/lib
COPY --from=base-builder /app/src ./src

ENV PYTHONPATH=/app

EXPOSE 8083
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8083"]

