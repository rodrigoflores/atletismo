Atletismo Project
=================

Created in 2009 Extreme Programming Lab course at University of Sao Paulo

Copyright:
University of Sao Paulo, 2009


Developers
----------

### 2009 ###

+ Daniel Sguilaro
+ Edith Mamani
+ Eduardo Kasa (as coach)
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
+ Rodrigo Flores (as coach)

Set up the environment for the project
--------------------------------------

### Required gems ###


#### Deploy - Develop ####
+ Authlogic 
+ Formtastic

#### Test ####

+ All the development gems
+ remarkable_rails
+ rspec >= 1.30 
+ rspec_rails
+ factory_girl
+ rcov

### Database Set up ###

1. Create a file called 'database.yml' with this content (this example is using SQLite3)

``
development: 
  adapter: sqlite3 
  database: db/development.sqlite3 
  pool: 5 
  timeout: 5000 

test:
  adapter: sqlite3 
  database: db/test.sqlite3 
  pool: 5 
  timeout: 5000 
``

2. Create the database

``
rake db:create
``

3. Do the migrations

``
rake db:migrate
``

4. (Optional, but highly recommended) If you want to test it, please repeat the commands in step 2 and 3 followed by a ``RAILS_ENV=test``


