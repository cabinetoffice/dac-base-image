DAC base image
==============

Docker base image to be used in Data Asset Catalogue. This is a public image, and it doesn't need authentication.

It's based on Ubuntu 18.04 and it comes with Python 3.8 installed.

Pull image from the command line:

    $ docker pull docker.pkg.github.com/cabinetoffice/dac-base-image/dac-base-image:latest

Use as base image in DockerFile:
  
    FROM docker.pkg.github.com/cabinetoffice/dac-base-image/dac-base-image:latest
