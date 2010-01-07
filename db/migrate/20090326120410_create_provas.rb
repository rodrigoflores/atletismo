class CreateProvas < ActiveRecord::Migration
  def self.up
    create_table :provas do |t|
      t.date :data
      t.time :tempo
      t.string :competicao
      t.references :atleta

      t.timestamps
    end
  end

  def self.down
    drop_table :provas
  end
end
