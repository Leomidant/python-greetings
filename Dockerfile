FROM python:3-alpine

WORKDIR /app
COPY requirements.txt requirements.txt
COPY app.py app.py

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 3000

ENTRYPOINT ["python", "app.py"]
