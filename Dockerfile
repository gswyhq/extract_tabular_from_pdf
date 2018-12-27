FROM python:3.5.6-stretch
#FROM ubuntu:18.04

RUN apt-get update && apt-get -y install python3-tk ghostscript vim less

RUN apt-get install -y libsm6 libxrender1 libxext-dev

# RUN pip3 install excalibur-py

RUN cd / && git clone https://github.com/camelot-dev/excalibur.git excalibur

COPY requirements.txt /excalibur/requirements.txt

RUN cd /excalibur && pip3 install -r requirements.txt -i http://pypi.douban.com/simple --trusted-host=pypi.douban.com

RUN sed -i s/127.0.0.1/0.0.0.0/g "/excalibur/excalibur/config_templates/default_excalibur.cfg"

WORKDIR /excalibur

EXPOSE 5000

CMD ["/bin/bash"]

# docker build -t gswyhq/extract_tabular_from_pdf -f Dockerfile .
# docker run --rm -it -p 5000:5000 gswyhq/extract_tabular_from_pdf python3 arthur.py

