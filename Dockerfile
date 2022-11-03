FROM ubuntu:22.04

RUN apt update && apt install wget -y
RUN wget https://bearware.dk/teamtalk/v5.11/teamtalk-v5.11-ubuntu22-x86_64.tgz && \
    gunzip teamtalk-v5.11-ubuntu22-x86_64.tgz && \
    tar xf teamtalk-v5.11-ubuntu22-x86_64.tar && \
    rm teamtalk-v5.11-ubuntu22-x86_64.tar && \
    cp -r teamtalk-v5.11-ubuntu22-x86_64/server server && \
    rm -rf teamtalk-v5.11-ubuntu22-x86_64 && \
    chmod +x server/tt5srv

EXPOSE 10333/udp 10333/udp
EXPOSE 10333/tcp 10333/tcp

WORKDIR /server

CMD ./tt5srv -wd ./data -nd