class ModificarItemTreino < ActiveRecord::Migration
  def self.up
    add_column :itens_treino, :minutos, :integer
    add_column :itens_treino, :segundos, :integer
    add_column :itens_treino, :decimos, :integer
    add_column :itens_treino, :grandeza, :string
    add_column :itens_treino, :observacao, :text
    add_column :itens_treino, :exercicio, :string    
    remove_column :itens_treino, :intensidade
  end

  def self.down
    remove_column :itens_treino, :minutos, :integer
    remove_column :itens_treino, :segundos, :integer
    remove_column :itens_treino, :decimos, :integer
    remove_column :itens_treino, :grandeza, :string
    remove_column :itens_treino, :observacao, :text
    remove_column :itens_treino, :exercicio
    add_column :itens_treino, :intensidade, :integer
  end
end
