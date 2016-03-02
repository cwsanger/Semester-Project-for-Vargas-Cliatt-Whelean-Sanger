class ChangeTypeToTitleInCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :type, :title
  end
end
