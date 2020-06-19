class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.string :wish_text

      t.timestamps
    end
  end
end
