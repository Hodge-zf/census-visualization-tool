FROM python:latest

RUN pip3 install mysql-connector-python

RUN pip3 install pandas

RUN pip3 install flask

RUN pip3 install gunicorn