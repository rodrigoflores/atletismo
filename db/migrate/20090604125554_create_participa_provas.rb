class CreateParticipaProvas < ActiveRecord::Migration
  def self.up
    remove_column :atletas, :provasParticipa
    create_table :participa_provas do |t|
      t.integer :atleta_id
      t.string :nome
      t.timestamps
    end
  end

  def self.down
    add_column :atletas, :provasParticipa, :string
    drop_table :participa_provas
  end
end
