class AdicionaCorAPeriodoDeTreino < ActiveRecord::Migration
  def self.up
	add_column :provas, :cor, :string
  end

  def self.down
	remove_column :provas, :cor, :string
  end
end
