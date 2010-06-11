class UpdateItemTreino < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :exercicio
    remove_column :itens_treino, :grandeza
    add_column :itens_treino, :exercicio_id, :integer
  end

  def self.down
    add_column :itens_treino, :grandeza, :string
    remove_column :itens_treino, :exercicio_id
    add_column :itens_treino, :exercicio, :string
  end
end
