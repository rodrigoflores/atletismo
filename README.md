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

1. Copy the file in config directory 'database.sqlite3.yml' to 'database.yml' (this example is using SQLite3)


2. Create the database

``
rake db:create
``

3. Do the migrations

``
rake db:migrate
``

4. (Optional, but highly recommended) If you want to test it, please repeat the commands in step 2 and 3 followed by a ``RAILS_ENV=test``

### Run it ###

1. Execute this command to run a server:

``
./script/server
``

2. Enjoy the application

### Test it ###

To test it you need to set up the tests

+ Run `rake spec` to execute all the tests
+ Run `rake spec:rcov` to get the Code Coverage


