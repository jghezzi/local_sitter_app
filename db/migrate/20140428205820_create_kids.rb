class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :comments
      t.integer :family_id

      t.timestamps
    end
  end
end
