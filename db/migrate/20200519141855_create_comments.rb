class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :root
      t.string :content
      t.integer :post_id
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
