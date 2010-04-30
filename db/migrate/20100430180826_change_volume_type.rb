class ChangeVolumeType < ActiveRecord::Migration
  def self.up
    remove_column :itens_treino, :volume
    add_column :itens_treino, :volume, :integer
  end

  def self.down
    remove_column :itens_treino, :volume
    add_column :itens_treino, :volume, :string
  end
end
