class CreateCarteredProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cartered_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.string :status
      t.string :order_id
      t.string :integer

      t.timestamps
    end
  end
end
