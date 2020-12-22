DAC base image
==============

Docker base image to be used in Data Asset Catalogue. This is a public image and it doesn't need authentication.

It contains:

1. Python 3.8
2. GDAL
3. Pandoc
4. Latex
5. Crystallised Python libraries (check requirements.txt)


Pull image from the command line:

    $ docker pull docker.pkg.github.com/cabinetoffice/dac-base-image/dac-base-image:latest

Use as base image in DockerFile:
  
    FROM docker.pkg.github.com/cabinetoffice/dac-base-image/dac-base-image:latest
