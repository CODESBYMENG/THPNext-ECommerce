# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.string :status

      t.timestamps
    end
  end
end
