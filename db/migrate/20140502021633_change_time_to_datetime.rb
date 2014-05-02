class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
  	change_column :sits, :start_time,  :datetime
  	change_column :sits, :end_time,  :datetime
  end
end
