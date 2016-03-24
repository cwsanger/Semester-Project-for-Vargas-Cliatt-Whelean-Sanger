class RemoveLikesFromLikeables < ActiveRecord::Migration
  def change
    remove_column :posts, :likes
    remove_column :comments, :likes
    remove_column :advertisements, :likes
  end
end
