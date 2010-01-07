class RelacionarAtletaComUsuario < ActiveRecord::Migration
  def self.up
     add_column :atletas, :user_id, :integer
     remove_column :atletas, :nome
  end

  def self.down
    remove_column :atletas, :user_id
    add_column :atletas, :nome, :string
  end
end
