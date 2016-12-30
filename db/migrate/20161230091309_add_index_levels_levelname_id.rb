class AddIndexLevelsLevelnameId < ActiveRecord::Migration
  def change
  	add_index :levels, :levelname_id, :unique => true
  end
end
