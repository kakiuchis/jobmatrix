class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.references :field, index: true, foreign_key: true
      t.integer :mintariff
      t.integer :maxtariff
      t.string :name
      t.text :skill
      t.text :tool
      t.text :certificate
      t.integer :field_id

      t.timestamps null: false
    end
  end
end
