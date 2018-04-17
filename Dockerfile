FROM python:3

RUN apt-get update && apt-get install -y gettext

ADD requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /usr/src/app

ADD . /usr/src/app

CMD ["luigid"]