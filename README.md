Projeto Atletismo 
=================

Criado em 2009 no curso de Laboratório de Programação Extrema da Universidade de São Paulo

Copyright:
Universidade de São Paulo, 2009


Programadores
-------------

### 2009 ###

+ Daniel Sguilaro
+ Edith Mamani
+ Eduardo Kasa (como coach)
+ Joao Paulo Mota
+ Marcela Ortega 
+ Pierre-Marie Leveque
+ Rodrigo Flores

### 2010 ###

+ Gustavo Vilela
+ Hugo Kondo
+ Itai Soares
+ Luiz Romagnoli
+ Omar Ajoue
+ Otavio Santana
+ Rodrigo Flores (como coach)

Configurando o ambiente
-----------------------

### Gems necessárias ###


#### Deploy - Desenvolvimento ####
+ Authlogic 
+ Formtastic

#### Teste ####

+ Todas as gems de desenvolvimento
+ remarkable_rails
+ rspec >= 1.30 
+ rspec_rails
+ factory_girl
+ rcov

### Criando o banco de dados ###

1. Renomeie o arquivo na pasta de configuração dentro de 'database.sqlite3.yml' para 'database.hyml' (o exemplo utiliza SQLite3)


2. Crie o banco de dados utilizando o comando

``
rake db:create
``

3. Faça as migrações necessárias

``
rake db:migrate
``

4. (opcional) para realizar testes, repita os passos 2 e 3 seguidos de ``RAILS_ENV=test``

### Configurações adicionais ###

Há dois ajustes que devem ser feitos para ter o site funcionando corretamente.

+ Configuração do banco de dados
Bem como qualquer aplicação rails, vocẽ pode configurar o banco de dados que irá utilizar editando o arquivo config/database.yml
+ Active Mailer (ferramenta para envio de e-mails)
Todos os e-mails criados são despachados utilizando um servidor SMTP. Você deve configurar um servidor SMTP à sua escolha no arquivo config/enviroinment.rb


### Executar ###

1. Execute o seguinte comando para iniciar o servidor:

``
./script/server
``

2. Navegue à vontade. Por padrão, o servidor abrirá em localhost:3000

### Testar ###

+ Execute `rake spec` para rodar todos os testes
+ Execute `rake spec:rcov` para obter o nível de cobertura de código


Observações relacionadas ao projeto
-----------------------------------

### Introdução ###

O Atletismo é um sítio que visa facilitar o relacionamento entre treinadores e atletas.
Inicialmente focado em atletismo, a intenção é que o sítio sirva como ferramenta para todas as modalidades de treino esportivo no futuro.
Os usuários do sistema cadastram-se e escolhem entre participar como treinador ou atleta. No caso dos atletas, é necessária a escolha de um treinador para supervisão.

+ Atualmente, o treinador é capaz de realizar as seguintes tarefas:
Acessar a calculadora de ritmos
Visualizar a listagem de atletas
Administrar os treinos de um atleta
Um treino é uma rotina a ser realizada em um dia e reportada de volta no sistema com seu resultado.
O treino é composto por vários itens de treino, que descreve os exercícios a serem realizados nesse treino.
Visualizar as provas de um atleta
O treinador visualiza as provas que um atleta cadastra. Provas são competições que um atleta participa e cadastra o resultado para que seu treinador acompanhe.
Administrar os testes de um atleta
Um teste é uma tarefa que o treinador passa para o atleta realizar e reportar os resultados. Serve também como acompanhamento de evolução.
Editar os Exercícios e Objetivos utilizados nos treinos
Os ítens de treino são classificados por tipo de exercício e objetivo. Estes dois filtros deverão utilizados futuramente na montagem de gráficos.
A discretização dos ítens de treino citada acima auxiliará na totalização dos dados.

+ Quanto ao atleta, as seguintes tarefas podem ser realizadas:
Visualizar os treinos e publicar comentários a respeito
Cadastrar provas para acompanhamento do treinador
Visualizar testes propostos e enviar seu resultado para o treinador


### Problemas ###

+ Banco de dados (problema com user, atleta e treinador)
Existe uma "confusão" no sistema, relacionada à escolha dos nomes.
Todos os usuários possuem um registro na tabela "users", e por sua vez possuem uma ligação à tabela "atletas", referenciada pelo campo atleta_id na tabela users ou ligado à tabela "treinadores", referenciado pelo campo treinador_id. Apenas um destes campos será preenchido por vez, afinal, cada usuário só pode ser treinador OU atleta.
A ambiguidade é que durante o desenvolvimento, é possível que você instancie um Atleta e confunda com a entidade User pois há campos em comum (a existência de um treinador_id em ambos), e isto não gerará erros de execução.
É necessário tomar cuidado quanto a isto. Por tratar-se de um problema legado e sua modificação impactar gigantescamente na estrutura atual do projeto, optamos por nos adaptar a esta ambiguidade.

### Estrutura ###

+ Namespace
A utilização de namespaces foi trazida para separar melhor o código dos controllers referentes a atletas e treinadores.
Um exemplo simples: com relação às provas. O Atleta cadastra e visualiza as provas, enquanto que o treinador apenas visualiza.
Para evitar verificações condicionais, optamos por separar o código em duas regiões distintas, permitindo que a mesma ação, por exemplo, view, possa ser chamada de pontos diferentes e estar logicamente bem separada.
 
+ Branches
Há duas "branches" no projeto: develop e master. A "branch" master contem a última versão estável, enquanto que a branch "develop" é utilizada pelos desenvolvedores.

### Status do projeto ###

Até a data de entrega, o projeto está com 100% de cobertura de código e funcional. Não há links quebrados e realizamos uma gigantesca limpeza em arquivos não utilizados.
Nem todas as rotinas estão devidamente separadas nos namespace devido. Isto é algo que poderia ser feito num primeiro passo de aprendizado, afinal, envolve apenas entender um pouco das rotinas e realizar a separação.
