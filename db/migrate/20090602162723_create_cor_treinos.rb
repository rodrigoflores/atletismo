class CreateCorTreinos < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :cor
    remove_column :itens_treino, :tipo
    create_table :cor_treinos do |t|
      t.integer :treinador_id
      t.string :cor
      t.string :tipo
    end
    add_column :itens_treino, :cor_treino_id, :integer
  end

  def self.down
    drop_table :cor_treinos
    add_column :itens_treino, :cor, :string
    add_column :itens_treino, :tipo, :string
    remove_column :itens_treino, :cor_treino_id
  end
end
