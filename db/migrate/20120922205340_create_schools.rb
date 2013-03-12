class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text :adress
      t.text :benefits
      t.string :locality
      t.string :tfn
      t.string :url
      t.timestamps
      t.string :slug
    end
  end
end
