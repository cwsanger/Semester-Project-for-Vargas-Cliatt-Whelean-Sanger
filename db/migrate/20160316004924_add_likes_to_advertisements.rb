class AddLikesToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :likes, :integer, default: 0
  end
end
