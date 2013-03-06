class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text   :desc
      t.string :adress
      t.string :locality
      t.string :benefits
      t.string :tfn
      t.string :url
      t.timestamps
      t.string :slug
    end
  end
end
