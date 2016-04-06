class MakeTempusers < ActiveRecord::Migration
  def change
    create_table :temp_users do |t|
      t.string :name
      t.string :email
    end
  end
end
