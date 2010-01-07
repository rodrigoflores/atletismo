class AddPeriodoProvas < ActiveRecord::Migration
  def self.up
    add_column :provas, :periodo, :string
  end

  def self.down
    remove_column :provas, :periodo
  end
end
