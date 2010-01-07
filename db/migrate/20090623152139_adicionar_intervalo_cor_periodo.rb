class AdicionarIntervaloCorPeriodo < ActiveRecord::Migration
  def self.up
    add_column :cor_periodos, :inicio, :date
    add_column :cor_periodos, :fim, :date
  end

  def self.down
    remove_column :cor_periodos, :inicio
    remove_column :cor_periodos, :fim
  end
end
