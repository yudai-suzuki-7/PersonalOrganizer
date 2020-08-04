class CreateWishChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_checks do |t|
       t.integer :wish_id,  null: false

      t.timestamps
    end
  end
end
