# This file is auto-generated from the current state of the database. Instead of editing this file,
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100622122205) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atletas", :force => true do |t|
    t.date     "nasc"
    t.integer  "peso",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "altura",       :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "treinador_id"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cor_periodos", :force => true do |t|
    t.integer "treinador_id"
    t.string  "cor"
    t.string  "periodo"
    t.date    "inicio"
    t.date    "fim"
  end

  create_table "cor_treinos", :force => true do |t|
    t.integer "treinador_id"
    t.string  "cor"
    t.string  "tipo"
  end

  create_table "exercicio", :force => true do |t|
    t.integer  "treinador_id"
    t.string   "exercicio"
    t.string   "unidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercicios", :force => true do |t|
    t.integer  "treinador_id"
    t.string   "exercicio"
    t.string   "unidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itens_treino", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repeticao"
    t.integer  "treino_id"
    t.integer  "series"
    t.integer  "cor_treino_id"
    t.integer  "minutos"
    t.integer  "segundos"
    t.integer  "decimos"
    t.integer  "volume"
    t.string   "pausa"
    t.string   "intervalo"
    t.string   "video_link"
    t.integer  "exercicio_id"
    t.integer  "objetivo_id"
  end

  create_table "objetivos", :force => true do |t|
    t.integer "treinador_id"
    t.string  "nome"
  end

  create_table "participa_provas", :force => true do |t|
    t.integer  "atleta_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provas", :force => true do |t|
    t.date     "data"
    t.string   "competicao"
    t.integer  "atleta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "segundos"
    t.integer  "minutos"
    t.integer  "decimos"
    t.string   "clima"
    t.integer  "distancia",      :limit => 10, :precision => 10, :scale => 0
    t.string   "tipoTempo"
    t.string   "comentarios"
    t.integer  "colocacao"
    t.integer  "horas"
    t.integer  "cor_periodo_id"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "testes", :force => true do |t|
    t.integer  "atleta_id"
    t.string   "nome"
    t.date     "data"
    t.integer  "minutos"
    t.integer  "segundos"
    t.integer  "decimos"
    t.text     "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descricao"
    t.float    "volume"
    t.string   "grandeza"
  end

  create_table "tipos", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treinadores", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treinos", :force => true do |t|
    t.date     "date"
    t.string   "text"
    t.string   "comentario"
    t.integer  "atleta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "observacao"
    t.boolean  "visualizado"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                :limit => 100, :default => ""
    t.string   "email",               :limit => 100
    t.string   "crypted_password",                                   :null => false
    t.string   "password_salt",                                      :null => false
    t.string   "persistence_token",                                  :null => false
    t.string   "perishable_token",                                   :null => false
    t.boolean  "atleta"
    t.boolean  "treinador"
    t.integer  "atleta_id"
    t.integer  "treinador_id"
    t.boolean  "activated"
    t.string   "activation_code"
    t.datetime "activated_at"
    t.string   "password_reset_code"
  end

end
