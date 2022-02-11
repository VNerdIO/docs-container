FROM python:3.9.10-alpine3.15

COPY requirements.txt /tmp/requirements.txt
RUN apk update
RUN apk add git
RUN pip install -r /tmp/requirements.txt
RUN git clone https://github.com/VNerdIO/vnerd-docs
WORKDIR vnerd-docs
RUN mkdocs serve
