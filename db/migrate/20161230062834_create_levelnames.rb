class CreateLevelnames < ActiveRecord::Migration
  def change
    create_table :levelnames do |t|
      t.integer :code
      t.string :name

      t.timestamps null: false
    end
  end
end
