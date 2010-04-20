class CreateTreinos < ActiveRecord::Migration
  def self.up
    create_table :treinos do |t|
      t.date :date
      t.string :text
      t.string :comentario
      t.integer :atleta_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :treinos
  end
end
