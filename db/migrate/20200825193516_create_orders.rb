# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :orders, %i[product_id user_id]
  end
end
