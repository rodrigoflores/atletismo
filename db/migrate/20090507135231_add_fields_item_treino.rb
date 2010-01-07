class AddFieldsItemTreino < ActiveRecord::Migration
  def self.up
    add_column :itens_treino, :repeticao, :integer
    add_column :itens_treino, :distancia, :integer
    add_column :itens_treino, :intensidade, :integer
    add_column :itens_treino, :descanso, :integer
    add_column :itens_treino, :treino_id, :integer
  end

  def self.down
    remove_column :itens_treino, :repeticao
    remove_column :itens_treino, :distancia
    remove_column :itens_treino, :intensidade
    remove_column :itens_treino, :descanso
    remove_column :itens_treino, :treino_id
  end
end
