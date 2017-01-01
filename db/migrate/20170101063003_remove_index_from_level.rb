class RemoveIndexFromLevel < ActiveRecord::Migration
  def change
  	remove_index :levels, :levelname_id
  end
end
