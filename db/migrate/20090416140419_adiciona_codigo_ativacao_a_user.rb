class AdicionaCodigoAtivacaoAUser < ActiveRecord::Migration
  def self.up
    add_column :users, :activation_code, :string
    add_column :users, :activated_at, :datetime
  end

  def self.down
    remove_column :users, :activation_code, :string
    remove_column :users, :activated_at, :datetime
  end
end
