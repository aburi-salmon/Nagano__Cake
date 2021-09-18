class AddFirstNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :first_name, :string
  end
end
