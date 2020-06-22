class CreateLogictrees < ActiveRecord::Migration[5.2]
  def change
    create_table :logictrees do |t|
      t.integer :wish_id, null: false
      t.string :logic1
      t.string :logic11
      t.string :logic12
      t.string :logic13
      t.string :logic2
      t.string :logic21
      t.string :logic22
      t.string :logic23
      t.string :logic3
      t.string :logic31
      t.string :logic32
      t.string :logic33

      t.timestamps
    end
  end
end
