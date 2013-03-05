class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :min
      t.integer :littin
      t.integer :risk1
      t.integer :risk2
      t.integer :hyrbil
      t.integer :paket_pris
      t.integer :school_id

      t.timestamps
    end
    add_index :prices, [:school_id]
  end
end
