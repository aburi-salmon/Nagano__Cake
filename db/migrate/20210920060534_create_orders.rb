class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment_method
      t.integer :status
      t.integer :delivery_cost
      t.integer :charge

      t.timestamps
    end
  end
end
