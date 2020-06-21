class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content
      t.string :log_img_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
