class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :fan_count
      t.integer :school_id

      t.timestamps
    end
    add_index :likes, :school_id, :name => 'like_index'
  end
end
