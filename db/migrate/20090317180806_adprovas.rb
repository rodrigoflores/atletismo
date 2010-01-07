class Adprovas < ActiveRecord::Migration
  def self.up
    add_column :atletas, :corre5,:boolean
    add_column :atletas, :corre10,:boolean
    add_column :atletas, :correMeiaMaratona,:boolean
    add_column :atletas, :correMaratona,:boolean
  end

  def self.down
    remove_column :atletas, :corre5,:boolean
    remove_column :atletas, :corre10,:boolean
    remove_column :atletas, :correMeiaMaratona,:boolean
    remove_column :atletas, :correMaratona,:boolean    
  end
end
