class AddLevelnameIdToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :levelname_id, :integer
  end
end
