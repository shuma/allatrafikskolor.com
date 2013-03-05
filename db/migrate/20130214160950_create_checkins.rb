class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :checkin_count
      t.integer :school_id

      t.timestamps
    end
    add_index :checkins, :school_id, :name => 'checkin_index'
  end
end
