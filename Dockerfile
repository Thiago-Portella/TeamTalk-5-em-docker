FROM ubuntu:22.04

ARG FILE_NAME
ARG URL

# Atualize o gerenciador de pacotes e instale o wget
RUN apt update && apt install wget -y

# Baixe e descompacte o TeamTalk
RUN wget ${URL} && \
    gunzip ${FILE_NAME}.tgz && \
    tar xf ${FILE_NAME}.tar && \
    rm ${FILE_NAME}.tar

# Copie o servidor para o diretório corrente e remova os arquivos desnecessários
RUN cp -r ${FILE_NAME}/server . && rm -rf ${FILE_NAME}

# Defina as portas TCP e UDP 10333 como expostas
EXPOSE 10333/tcp 10333/udp

# Defina o diretório de trabalho como o diretório do servidor
WORKDIR /server

# Crie o diretório "data"
RUN mkdir data

# e desative a criação de um novo usuário administrador
CMD ./tt5srv -wd ./data -nd