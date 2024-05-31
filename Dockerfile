FROM python:3.12-alpine

WORKDIR /app
 
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["ddtrace-run", "python3", "app.py"]