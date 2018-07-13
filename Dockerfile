FROM ubuntu:18.04
LABEL Name=natasha Version=0.0.1
WORKDIR /app

RUN apt-get update && apt-get -y install python3 && \
    apt-get -y install python3-pip && \
    apt-get -y install build-essential checkinstall && \
    apt-get -y install wget && wget http://www.imagemagick.org/download/ImageMagick.tar.gz && \
    tar xzvf ImageMagick.tar.gz && ./ImageMagick-*/configure && make clean && \
    make && checkinstall && ldconfig /usr/local/lib && rm -r * && \
    pip3 install wand && pip3 install pipenv
    
ADD ./app /app
CMD ["/bin/bash"]
