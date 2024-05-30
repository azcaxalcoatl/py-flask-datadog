FROM python:3.9-alpine

RUN apk --update add gcc musl-dev linux-headers

WORKDIR /app
 
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["ddtrace-run", "python3", "app.py"]