class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :uid
      t.string :name
      t.string :image
      t.string :gender
      t.string :urls
      t.integer :user_id
      t.timestamps
    end
  end
end
