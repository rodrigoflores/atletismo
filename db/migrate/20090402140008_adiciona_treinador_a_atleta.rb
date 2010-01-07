class AdicionaTreinadorAAtleta < ActiveRecord::Migration
  def self.up
    add_column :atletas, :treinador_id, :integer
  end

  def self.down
    remove_column :atletas, :treinador_id
  end
end
