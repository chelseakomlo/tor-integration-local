FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python
RUN apt-get install --reinstall -y python-pkg-resources
RUN apt-get install -y python-mock
RUN apt-get install -y pyflakes
RUN apt-get install -y git
RUN apt-get install -y make
RUN apt-get install -y automake
RUN apt-get install -y tor
RUN apt-get install -y gcc
RUN apt-get install -y libevent-dev
RUN apt-get install -y libssl-dev

RUN git clone https://git.torproject.org/chutney.git
RUN git clone https://git.torproject.org/stem.git

RUN useradd -ms /bin/bash integ-tester

RUN chown -R integ-tester /stem
RUN chown -R integ-tester /chutney

USER integ-tester

ENV STEM_SOURCE_DIR=/stem
ENV CHUTNEY_PATH=/chutney

