class CreateTreinos < ActiveRecord::Migration
  def self.up
    create_table :treinos do |t|
      t.date :date
      t.string :text
      t.string :comentario
      t.integer :atleta_id
      
      t.timestamps
    end
    add_column :atletas, :treino_id, :integer
  end

  def self.down
    drop_table :treinos
    remove_column :atletas, :treino_id;
  end
end
