class RemoveLevelNameFromLevels < ActiveRecord::Migration
  def change
    remove_column :levels, :level_name_id, :integer
  end
end
