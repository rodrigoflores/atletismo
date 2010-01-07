class CreateAtletas < ActiveRecord::Migration
  def self.up
    create_table :atletas do |t|
      t.string :nome
      t.date :nasc
      t.decimal :peso
      t.decimal :altura

      t.timestamps
    end
  end

  def self.down
    drop_table :atletas
  end
end
