class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :order_status
      t.string  :name
      t.string :postal_code
      t.string :address
      t.integer :postage, default: 800
      t.integer :price
      t.integer :payment
      t.timestamps
    end
  end
end
