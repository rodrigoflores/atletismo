class DescansoViraIntervaloEPausa < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :descanso, :integer
    add_column :itens_treino, :pausa, :integer
    add_column :itens_treino, :intervalo, :integer
  end

  def self.down
    add_column :itens_treino, :descanso, :integer
    remove_column :itens_treino, :pausa, :integer
    remove_column :itens_treino, :intervalo, :integer
  end
end
