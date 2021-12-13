class CreateCartoons < ActiveRecord::Migration[6.1]
  def change
    create_table :cartoons do |t|
      t.string :name
      t.string :status
      t.string :writer
      t.string :shortinfo
      t.string :daytoupdate

      t.timestamps
    end
  end
end
