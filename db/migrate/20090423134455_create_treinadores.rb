class CreateTreinadores < ActiveRecord::Migration
  def self.up
    create_table :treinadores do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :treinadores
  end
end
