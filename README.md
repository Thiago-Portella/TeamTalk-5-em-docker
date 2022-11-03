# TeamTalk-5-em-docker
Executa o TeamTalk 5 dentro de um docker
## modo de uso
Para executar essa imagen, primeiro é necessário criar uma pasta onde vai ficar o arquivo tt5srv.xml e o arquivo de log.
Aqui noz vamos supor que o arquivo esteja em "/home/ubuntu/repo/comTT".
Se o arquivo tt5srv.xml não estiver la, o TeanTalk vai criar um padrão.
Recomendo você criar pelomenos um inicial.

 Entre na pasta desse repositório e builda a imagem, com o comando
docker build -t ttd .
Depois, basta executar com o comando

docker run -dv /home/ubuntu/repo/comTT:/server/data -p 10333:10333 -p 10333:10333/udp ttd

Se caso você quiser que a imagem execute ao iniciar o systema, use esse comando:

docker run --restart=on-failure -dv /home/ubuntu/repo/comTT:/server/data -p 10333:10333 -p 10333:10333/udp ttd

## Avisos
Se caso as portas que você definio no arquivo tt5srv.xml for diferente da padrão, 10333, você tem que mudar no comando tanbén, por que se não o docker não vai mapear a porta para a máquina host.

No linux, pelomenos no ubuntu, todos esses comandos terão que ser executados como sudo.