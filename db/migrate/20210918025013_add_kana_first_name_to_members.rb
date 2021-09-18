class AddKanaFirstNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :kana_first_name, :string
  end
end
