class AddStudentidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :studentid, :string
  end
end
