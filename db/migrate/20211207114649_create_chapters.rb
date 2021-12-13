class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.integer :num
      t.references :cartoon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
