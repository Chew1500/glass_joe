# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
# FROM python:alpine
FROM python


# Set working directory
WORKDIR /app

# Install requirements early, try to reuse this layer as much as we can
COPY requirements.txt /app
RUN python3 -m pip install -r requirements.txt

# Set label and expose default port
LABEL Name=glass_joe Version=0.0.1
#EXPOSE 80, 27017

# Add files from CWD
ADD . /app

# Using pip:
# RUN python3 -m pip install -r requirements.txt
CMD ["python3", "-m", "main"]
