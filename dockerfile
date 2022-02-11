FROM python:3.9.10-alpine3.15.0

RUN pip install -r requirements.txt
RUN git clone https://github.com/VNerdIO/vnerd-docs
RUN mkdocs serve