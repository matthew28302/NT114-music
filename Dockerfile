FROM mysql:8.2.0
RUN mysql -u root -ppassword -e "create DATABASE my_music;"
RUN mysql -u root -ppassword my_music<table.sql
EXPOSE 3306

FROM python:3.13.0a2-slim-bullseye AS requirements
RUN apt-get update -y
RUN apt-get install -y python3-pip pkg-config libmariadb-dev  # Install the required development headers
RUN pip install -r https://raw.githubusercontent.com/akki111singh/Flask-Music-app/master/requirements.txt
RUN pip install requests
RUN mkdir /app
COPY ./ /app
WORKDIR /app
EXPOSE 5000
CMD [ "python3","app.py" ]