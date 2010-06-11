class CreateObjetivos < ActiveRecord::Migration
  def self.up
    create_table :objetivos do |t|
      t.integer :treinador_id
      t.string  :nome
    end
  end

  def self.down
    drop_table :objetivos
  end
end
