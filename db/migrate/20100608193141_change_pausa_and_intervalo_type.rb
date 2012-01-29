class ChangePausaAndIntervaloType < ActiveRecord::Migration
  def self.up
  	remove_column :itens_treino, :pausa
  	add_column  :itens_treino, :pausa, :string
  	remove_column :itens_treino, :intervalo
  	add_column  :itens_treino, :intervalo, :string

  end

  def self.down
  	remove_column :itens_treino, :pausa
  	add_column  :itens_treino, :pausa, :integer
  	remove_column :itens_treino, :intervalo
  	add_column  :itens_treino, :intervalo, :integer
  end
end
