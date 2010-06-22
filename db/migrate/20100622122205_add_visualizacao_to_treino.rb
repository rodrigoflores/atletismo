class AddVisualizacaoToTreino < ActiveRecord::Migration
  def self.up
    add_column :treinos, :visualizacao, :boolean
  end

  def self.down
    remove_column :treinos, :visualizacao
  end
end