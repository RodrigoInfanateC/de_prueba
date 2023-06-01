class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total_amount
      t.string :customer_name
      t.string :customer_email
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
