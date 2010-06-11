class UpdateItemTreino < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :grandeza
    remove_column :itens_treino, :exercicio
    add_column :itens_treino, :exercicio, :integer
  end

  def self.down
    add_column :itens_treino, :grandeza, :string
    add_column :itens_treino, :exercicio, :string
    remove_column :itens_treino, :exercicio
  end
end
