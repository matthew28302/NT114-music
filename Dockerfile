FROM mysql:8.2.0
ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_HOST=127.0.0.1
# Copy your table.sql file to the container
COPY table.sql /docker-entrypoint-initdb.d/

FROM python:3.13.0b2-slim-bullseye 
RUN apt-get update -y
RUN apt-get install -y python3-pip pkg-config libmariadb-dev  # Install the required development headers

# Copy the requirements.txt file to the container
COPY requirements.txt /app/requirements.txt

WORKDIR /app

# Install dependencies
RUN pip install -r requirements.txt
RUN pip install requests

COPY . /app

EXPOSE 5000

CMD ["python3", "app.py"]
