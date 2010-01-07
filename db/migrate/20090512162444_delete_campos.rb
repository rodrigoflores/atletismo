class DeleteCampos < ActiveRecord::Migration
  def self.up
    remove_column :atletas, :corre5
    remove_column :atletas, :corre10
    remove_column :atletas, :correMeiaMaratona
    remove_column :atletas, :correMaratona
    
    add_column :atletas, :provasParticipa, :string
  end
  
  def self.down
    add_column :atletas, :corre5, :boolean
    add_column :atletas, :corre10 , :boolean
    add_column :atletas, :correMeiaMaratona, :boolean
    add_column :atletas, :correMaratona, :boolean
    
    remove_column :atletas, :provasParticipa
  end
end
