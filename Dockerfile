FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/streamlit/streamlit-example.git .

RUN pip3 install -r requirements.txt

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# EXPOSE 8501 は Streamlit のデフォルトポートなので、Gunicornでも同じポートを使用
EXPOSE 8501

# CMD 命令を Gunicorn で Streamlit アプリを起動するように変更
CMD ["gunicorn", "app:app", "-w", "3", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8501"]