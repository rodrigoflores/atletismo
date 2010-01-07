class RemoveTempoAsTimeEAdicionaCampoMinutoSegundo < ActiveRecord::Migration
  def self.up
    remove_column :provas, :tempo
    add_column :provas, :segundos, :integer
    add_column :provas, :minutos, :integer
    add_column :provas, :decimos, :integer
  end

  def self.down
    remove_column :provas, :segundos 
    remove_column :provas, :minutos
    remove_column :provas, :decimos
    add_column :provas, :tempo, :time
  end
end
