FROM python:3.12-slim
WORKDIR /app
EXPOSE 8080
ENV PORT=8080
ENV HOST=0.0.0.0
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8080"]
