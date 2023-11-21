FROM ubuntu:22.04

# Atualize o gerenciador de pacotes e instale o wget
RUN apt update && apt install wget -y

# Baixe e descompacte o TeamTalk
RUN wget https://bearware.dk/teamtalk/v5.14/teamtalk-v5.14-ubuntu22-x86_64.tgz && \
    gunzip teamtalk-v5.14-ubuntu22-x86_64.tgz && \
    tar xf teamtalk-v5.14-ubuntu22-x86_64.tar && \
    rm teamtalk-v5.14-ubuntu22-x86_64.tar

# Copie o servidor para o diretório corrente e remova os arquivos desnecessários
RUN cp -r teamtalk-v5.14-ubuntu22-x86_64/server . && rm -rf teamtalk-v5.14-ubuntu22-x86_64

# Defina as portas TCP e UDP 10333 como expostas
EXPOSE 10333/tcp 10333/udp

# Defina o diretório de trabalho como o diretório do servidor
WORKDIR /server

# Crie o diretório "data"
RUN mkdir data

# e desative a criação de um novo usuário administrador
CMD ./tt5srv -wd ./data -nd