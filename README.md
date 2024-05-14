# TeamTalk-5-em-docker
Executa o TeamTalk 5 dentro de um docker
## modo de uso
Para executar essa imagen, primeiro é necessário criar uma pasta onde vai ficar o arquivo tt5srv.xml e o arquivo de log.
Aqui noz vamos supor que o arquivo esteja em "/home/ubuntu/repo/comTT".
Se o arquivo tt5srv.xml não estiver la, o TeanTalk vai criar um padrão.
Recomendo você criar pelomenos um inicial.

 Entre na pasta desse repositório e builda a imagem, com o comando
`docker-compose build` .
Depois, basta executar com o comando

```bash
docker-compose up -d
```

## atualizando
Eu vou fazer o possível pra manter esse repositório atualizado com o TT oficial. mas se caso queira atualizar por conta, basta editar as variáveis `FILE_NAME` e `URL` no arquivo docker-compose.yml.

Não coloque a extenção do arquivo na variável `FILE_NAME`, pois o dockerfile concidera que o nome não vai vir com extenção.

## Avisos
Se caso as portas que você definio no arquivo tt5srv.xml for diferente da padrão, 10333, você tem que mudar no docker-compose tanbén, por que se não o docker não vai mapear a porta para a máquina host.

No linux, pelomenos no ubuntu, todos esses comandos terão que ser executados como sudo.

## Workflow
Esse repositório inclui uma pasta `.github`, para vocè subir sua imagem para uma vps diretamente do github, com github action.

Para usar a action, fassa o seguinte.

- Fassa um fork desse repositório para sua conta.
- nas abas no início da página, clique em `Mais>Configurações`
- em `Segredos e variáveis`, clique em `Ações`.
- clique em `Novo segredo do repositório` e crie 4 segredos, com os dados de sua vps.

Os segredos a serem criados, serão os seguintes.

- `HOST`: o ip ou domínio da vps.
- `PORT`: a porta ssh da vps.
- `SSHKEY`: o texto que tem dentro da sua chave key ssh da vps. não tem como conectar pela senha.
- `USERNAME`: o usuário ssh da vps.
