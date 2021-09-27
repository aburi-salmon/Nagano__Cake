class AddPostalCodeToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :postal_code, :string
  end
end
