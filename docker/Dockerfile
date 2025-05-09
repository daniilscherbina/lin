FROM python:3.10-slim as builder

WORKDIR /app

COPY pyproject.toml ./
COPY src ./src
COPY tests ./tests

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir . pytest

FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /app/src /app/src

EXPOSE 8083
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8083"]

