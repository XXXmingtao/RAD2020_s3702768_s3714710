class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :topic
      t.text :text
      t.integer :view
      t.integer :comment
      t.integer :user_id
      t.timestamps
    end
  end
end
