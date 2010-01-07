class AddTipoEMetodoItemTreino < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino,:descricao
    remove_column :itens_treino,:distancia
    add_column :itens_treino, :tipo, :string
    add_column :itens_treino, :metodo, :string
    add_column :itens_treino, :cor, :string
    add_column :itens_treino, :series, :integer
    add_column :itens_treino, :volume, :string
  end

  def self.down
    add_column :itens_treino, :descricao, :string
    add_column :itens_treino, :distancia, :integer 
    remove_column :itens_treino, :tipo
    remove_column :itens_treino, :metodo
    remove_column :itens_treino, :cor
    remove_column :itens_treino, :series
    remove_column :itens_treino, :volume
  end
end
