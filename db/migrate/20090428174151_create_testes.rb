class CreateTestes < ActiveRecord::Migration
  def self.up
    create_table :testes do |t|
      t.references :atleta
      t.string :nome
      t.date :data
      t.integer :minutos
      t.integer :segundos
      t.integer :decimos
      t.integer :metros
      t.integer :centimetros
      t.decimal :kg
      t.string :clima
      t.string :periodo
      t.text :comentarios

      t.timestamps
    end
  end

  def self.down
    drop_table :testes
  end
end
