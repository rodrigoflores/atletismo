class ChangingNameFromMetodoToObjetivo < ActiveRecord::Migration
  def self.up
    rename_column :itens_treino, :metodo, :objetivo

  end

  def self.down
    rename_column :itens_treino, :objetivo, :metodo
  end
end
