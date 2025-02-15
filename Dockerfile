FROM python:3
ENV PYTHONUNBUFFERED True
EXPOSE 8080
ENV APP_HOME /app
WORKDIR $APP_HOME

COPY . ./
RUN pip install --upgrade pip
RUN pip install wheel
RUN pip install -r requirements.txt
#CMD streamlit run --server.port 8080 --server.enableCORS false app.py
ENTRYPOINT ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.port=8080"]