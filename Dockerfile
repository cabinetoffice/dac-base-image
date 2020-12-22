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
  # Translations dependencies
  && apt-get install -y gettext \
  && apt-get install -y wget \
  && apt-get install -y cmake python3.8 python3.8-dev python3-pip \
  # Latex
  && apt-get install -y texlive-latex-base texlive-latex-recommended texlive-pictures texlive-latex-extra texlive-fonts-extra texlive-xetex \
  && apt-get install -y lmodern texlive-fonts-recommended texlive-plain-generic wget texlive-luatex \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN python -m pip install -U pip setuptools wheel

# Pandoc
RUN wget --no-check-certificate https://github.com/jgm/pandoc/releases/download/2.11.2/pandoc-2.11.2-1-amd64.deb \
  && dpkg -i pandoc-2.11.2-1-amd64.deb

# GDAL
RUN add-apt-repository ppa:ubuntugis/ppa \
  && apt-get update \
  && apt-get install -y gdal-bin
