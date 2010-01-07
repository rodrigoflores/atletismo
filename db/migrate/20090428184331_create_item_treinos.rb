class CreateItemTreinos < ActiveRecord::Migration
  def self.up
    create_table :itens_treino do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :itens_treino
  end
end
