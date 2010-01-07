class EditClimaDistanciaTempo < ActiveRecord::Migration
  def self.up
        add_column :provas, :clima,:string
        add_column :provas, :distancia,:decimal
        add_column :provas, :tipoTempo,:string
  end

  def self.down
        remove_column :provas, :clima,:string
        remove_column :provas, :distancia,:decimal
        remove_column :provas, :tipoTempo,:string
  end
end
