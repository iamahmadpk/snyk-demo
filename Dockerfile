FROM python:3.9-slim-bullseye

WORKDIR /myproject

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update \
    && apt-get install -y --no-install-recommends screen \
    && rm -rf /var/lib/apt/lists/*

COPY . .

CMD ["python", "hello.py"]
