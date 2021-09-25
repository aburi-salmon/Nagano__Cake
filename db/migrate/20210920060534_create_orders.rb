class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :delivery_cost, null: false
      t.integer :charge, null: false

      t.timestamps
    end
  end
end
