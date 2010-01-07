class CreateTableCorPeriodo < ActiveRecord::Migration
  def self.up
    create_table :cor_periodos do |t|
      t.integer :treinador_id
      t.string :cor
      t.string :periodo
    end
  end

  def self.down
    drop_table :cor_periodos
  end
end
