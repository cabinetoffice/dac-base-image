FROM ubuntu:18.04

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential software-properties-common \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Python
  && apt-get install -y cmake python3.8 python3.8-dev python3-pip \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN python -m pip install -U pip setuptools wheel
