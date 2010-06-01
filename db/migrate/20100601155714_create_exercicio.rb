class CreateExercicio < ActiveRecord::Migration
  def self.up
    create_table :exercicio do |t|
      t.integer :treinador_id
      t.string :exercicio
      t.string :unidade
      t.timestamps
    end
  end

  def self.down
    drop_table :exercicio
  end
end
