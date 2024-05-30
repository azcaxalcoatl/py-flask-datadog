FROM python:3.13.0b1-bullseye

ENV DD_SERVICE="liverpool-api-dev"
ENV DD_ENV="football-data-dev"
ENV DD_VERSION="0.0.1"

LABEL com.datadoghq.tags.service="liverpool-api-dev"
LABEL com.datadoghq.tags.env="football-data-dev"
LABEL com.datadoghq.tags.version="0.0.1"

WORKDIR /app

COPY ../requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["ddtrace-run", "python3", "-m", "app.py"]