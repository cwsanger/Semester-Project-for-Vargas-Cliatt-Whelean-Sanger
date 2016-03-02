class ChangeCategoryToCategoryId < ActiveRecord::Migration
  def change
    rename_column :posts, :category, :category_id
  end
end
