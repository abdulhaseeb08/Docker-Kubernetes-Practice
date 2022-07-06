FROM python:3.10-slim AS builder
WORKDIR /secondweek

FROM builder AS stage1
COPY ./requirements.txt /secondweek/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /secondweek/requirements.txt

FROM stage1 AS stage2
COPY ./app /secondweek/app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]