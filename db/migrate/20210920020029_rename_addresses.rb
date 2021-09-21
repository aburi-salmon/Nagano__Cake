class RenameAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :addresses, :address
  end
end
