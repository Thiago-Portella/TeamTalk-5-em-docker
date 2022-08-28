FROM ubuntu:20.04

RUN apt update && apt install -y wget
RUN wget        https://bearware.dk/teamtalk/v5.10/teamtalk-v5.10-ubuntu18-x86_64.tgz && \
    gunzip teamtalk-v5.10-ubuntu18-x86_64.tgz && \
    tar xf teamtalk-v5.10-ubuntu18-x86_64.tar && \
    rm teamtalk-v5.10-ubuntu18-x86_64.tar && \
    cp -r teamtalk-v5.10-ubuntu18-x86_64/server server && \
    rm -rf teamtalk-v5.10-ubuntu18-x86_64 && \
    chmod +x server/tt5srv

COPY tt5srv.xml server/tt5srv.xml

EXPOSE 10333/udp 10333/udp
EXPOSE 10333/tcp 10333/tcp

WORKDIR /server

CMD ./tt5srv -nd