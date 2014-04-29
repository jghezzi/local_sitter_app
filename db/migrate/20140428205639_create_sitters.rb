class CreateSitters < ActiveRecord::Migration
  def change
    create_table :sitters do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
