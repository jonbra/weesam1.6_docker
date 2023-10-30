FROM ubuntu:20.04
LABEL Name=weesamdocker Version=0.0.1 maintainer="Jon Bråte jon.brate@fhi.no"
RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y build-essential wget unzip

# Install Python3
RUN apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# Install pysam and seaborn
RUN pip install pysam
RUN pip install seaborn

# Install WeeSAMv1.6
RUN wget https://raw.githubusercontent.com/centre-for-virus-research/weeSAM/master/weeSAM \
    && cp weeSAM /usr/bin/weeSAMv1.6

RUN chmod +x /usr/bin/weeSAMv1.6
