class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.integer :user_id, null: false
      t.string :wish_text,  null: false
      t.integer :wish_status, default: 0

      t.timestamps
    end
  end
end
