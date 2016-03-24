class RenameLikeToLikes < ActiveRecord::Migration
  def change
    rename_column :posts, :like, :likes
    rename_column :comments, :like, :likes
  end
end
