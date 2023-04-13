
1.A instalação deve ser feita em uma pasta chamada 'jesus', dentro do diretório /opt.

2.Deve-se instalar a biblioteca lwp::useragent com o comando:

    apt-get install libtest-lwp-useragent-perl

3.Salvar no docroot do site smithsoftwares.com a camada web contida no arquivo 'jesus_web_php.tar.gz'.
  Que encontra-se na pasta /opt/jesus/docs.

4.Para rodar entre na pasta main e chame o script 'run.sh' passando o path como parametro, conforme:

    ./run.sh '/opt/jesus'

5.Verificar se foi gerado arquivo de log na pasta /opt/jesus/log e se houve registro da execução.

6.Agende o serviço no CRON.

7.Copiar o script 'development.sh' para usar em seu ambiente, alterando o usuário do ssh.

