class UpdateTreinos < ActiveRecord::Migration
  def self.up
    add_column :treinos, :visualizado, :boolean
  end

  def self.down
    remove_column :treinos, :visualizado
  end
end
