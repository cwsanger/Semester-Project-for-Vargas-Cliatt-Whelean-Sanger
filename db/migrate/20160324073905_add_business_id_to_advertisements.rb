class AddBusinessIdToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :business_id, :integer
  end
end
