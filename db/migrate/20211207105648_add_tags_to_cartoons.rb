class AddTagsToCartoons < ActiveRecord::Migration[6.1]
  def change
    add_column :cartoons, :tags, :text , array: true, default: []
  end
end
