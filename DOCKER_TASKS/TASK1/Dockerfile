FROM python:3.11.11-slim-bookworm

WORKDIR /streamlit_app

COPY requirements.txt ./

RUN pip install -r requirements.txt

EXPOSE 8501

COPY app ./

CMD ["streamlit", "run", "./data_process.py"]