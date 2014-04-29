class CreateSits < ActiveRecord::Migration
  def change
    create_table :sits do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :status
      t.integer :family_id
      t.integer :sitter_id

      t.timestamps
    end
  end
end
