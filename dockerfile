FROM alpine:3.15

COPY requirements.txt /tmp/requirements.txt
ENV PYTHONUNBUFFERED=1

RUN apk update
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN apk add git
RUN apk add nginx
RUN pip install -r /tmp/requirements.txt
RUN git clone https://github.com/VNerdIO/vnerd-docs
WORKDIR vnerd-docs
RUN mkdocs build
RUN cp -r site/* /var/www/localhost/htdocs/
COPY default.conf /etc/nginx/http.d

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
