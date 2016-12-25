class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :level, index: true, foreign_key: true
      t.text :content
      t.integer :level_id

      t.timestamps null: false
    end
  end
end
