class AddStudentidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :card_num, :string
  end
end
