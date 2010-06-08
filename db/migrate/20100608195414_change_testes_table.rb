class ChangeTestesTable < ActiveRecord::Migration
  def self.up
  	change_table(:testes) do |t|
  		t.remove :metros
  		t.remove :centimetros
  		t.remove :kg
  		t.remove :clima
  		t.remove :periodo
  		t.text	 :descricao
  		t.float	 :volume
  		t.string :grandeza
		end
  end

  def self.down 
  	change_table :testes do |t| 
			t.integer :metros
			t.integer :centimetros
			t.integer :kg
			t.string :clima
			t.string :periodo
			t.remove	 :descricao
			t.remove	 :volume
			t.remove :grandeza
		end
  end
end
