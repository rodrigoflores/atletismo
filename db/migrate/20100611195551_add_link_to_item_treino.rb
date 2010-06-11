class AddLinkToItemTreino < ActiveRecord::Migration
  def self.up
  	add_column :itens_treino, :video_link, :string
  end

  def self.down
  	remove_column :itens_treino, :video_link
  end
end
