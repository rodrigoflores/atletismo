class ObservacaoGoFromItemTreinoToTreino < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :observacao, :text
    add_column  :treinos, :observacao, :text
  end

  def self.down
    remove_column :treinos, :observacao, :text
    add_column :itens_treino, :observacao, :text
  end
end
