class AddColocacaoeComentarios < ActiveRecord::Migration
  def self.up
    add_column :provas, :comentarios,:string
    add_column :provas, :colocacao, :integer
  end

  def self.down
    remove_column :provas, :comentarios,:string
    remove_column :provas, :colocacao, :integer
  end
end
