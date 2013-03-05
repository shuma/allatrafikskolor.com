class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.belongs_to :school
      t.belongs_to :user
      t.timestamps
    end
    add_index :reviews, [:school_id, :user_id]
  end
end
