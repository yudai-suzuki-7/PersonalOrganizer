class CreateBooklogs < ActiveRecord::Migration[5.2]
  def change
    create_table :booklogs do |t|
      t.integer :user_id
      t.string :book_title
      t.string :book_author
      t.string :book_img_url
      t.text :book_impression
      t.string :isbn

      t.timestamps
    end
  end
end
