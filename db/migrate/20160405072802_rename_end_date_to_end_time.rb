class RenameEndDateToEndTime < ActiveRecord::Migration
  def change
    rename_column :events, :end_date, :end_time
  end
end
