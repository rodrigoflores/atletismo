class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string :name,                      :limit => 100, :default => '', :null => true
      t.string :email,                     :limit => 100
      t.string :crypted_password,          :null => false
      t.string :password_salt,             :null => false
      t.string :persistence_token,         :null => false
      t.string :perishable_token,          :null => false
      t.boolean :atleta
      t.boolean :treinador
      t.integer :atleta_id
      t.integer :treinador_id
      t.boolean :activated
    end
  end

  def self.down
    drop_table "users"
  end
end
