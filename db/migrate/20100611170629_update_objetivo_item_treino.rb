class UpdateObjetivoItemTreino < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :objetivo
    add_column :itens_treino, :objetivo_id, :integer
  end

  def self.down
    remove_column :itens_treino, :objetivo_id
    add_column :itens_treino, :objetivo, :string
  end
end
