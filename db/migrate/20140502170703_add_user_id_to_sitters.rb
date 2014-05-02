class AddUserIdToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :user_id, :integer
  end
end
