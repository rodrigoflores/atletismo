class AdicionaCorPeriodoProva < ActiveRecord::Migration
  def self.up
    remove_column :provas, :periodo
    remove_column :provas, :cor
    add_column :provas, :cor_periodo_id, :integer
  end

  def self.down
    remove_column :provas, :cor_periodo_id
    add_column :provas, :periodo, :string
    add_column :provas, :cor, :string
  end
end
