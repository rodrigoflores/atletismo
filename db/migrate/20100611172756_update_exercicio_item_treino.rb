class UpdateExercicioItemTreino < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :grandeza
    remove_column :itens_treino, :exercicio

  end

  def self.down
    add_column :itens_treino, :grandeza, :string
    add_column :itens_treino, :exercicio, :string
  end
end
