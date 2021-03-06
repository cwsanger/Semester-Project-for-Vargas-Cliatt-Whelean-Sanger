class CreateUsersAndGroupsJoinTable < ActiveRecord::Migration
  def change
    create_table :users_groups, id: false do |t|
      t.integer :user_id
      t.integer :group_id
    end

    add_index :users_groups, [:user_id, :group_id]
  end
end
