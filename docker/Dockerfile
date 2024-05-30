FROM python:3.9-alpine

RUN apk --update add gcc musl-dev linux-headers

ENV DD_SERVICE="liverpool-api-dev"
ENV DD_ENV="football-data-dev"
ENV DD_VERSION="0.0.1"

LABEL com.datadoghq.tags.service="liverpool-api-dev"
LABEL com.datadoghq.tags.env="football-data-dev"
LABEL com.datadoghq.tags.version="0.0.1"

WORKDIR /app
 
COPY python/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY python/* .

EXPOSE 5000

CMD ["ddtrace-run", "python3", "app.py"]