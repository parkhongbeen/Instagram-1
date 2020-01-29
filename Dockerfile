FROM        python:3.7-slim

RUN         apt -y update && apt -y dist-upgrade && apt -y autoremove

# requirements를 /tmp에 복사 후, pip install실행
COPY        ./.requirements/base.txt /tmp/
COPY        ./.requirements/production.txt /tmp/
RUN         pip install -r /tmp/production.txt

# 소스코드 복사 후 runserver
COPY        . /srv/instagram
WORKDIR     /srv/instagram/app
CMD         python manage.py runserver 0:8000