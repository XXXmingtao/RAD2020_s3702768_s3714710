class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :author_id
      t.string :topic
      t.text :text
      t.integer :view
      t.integer :comment

      t.timestamps
    end
  end
end
