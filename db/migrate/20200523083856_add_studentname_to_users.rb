class AddStudentnameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :studentname, :string
  end
end
