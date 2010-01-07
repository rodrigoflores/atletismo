class AddHoras < ActiveRecord::Migration
  def self.up
     add_column :provas, :horas, :integer
   end
 
   def self.down
     remove_column :provas, :horas
   end
end
