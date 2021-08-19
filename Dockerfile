FROM python:3.8-alpine

RUN apk update && \
        apk add --no-cache \
	bash

RUN apk add --update build-base python3-dev py-pip
ENV LIBRARY_PATH=/lib:/usr/lib
EXPOSE 9000
WORKDIR /py_app
COPY . /py_app
RUN pip install -r ./app/requirements.txt

ENV FLASK_APP=py_app
ENV FLASK_ENV=development


ENTRYPOINT ["python"]
CMD ["./app/py_app.py"]

