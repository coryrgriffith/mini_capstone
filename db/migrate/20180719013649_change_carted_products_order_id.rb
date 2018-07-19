class ChangeCartedProductsOrderId < ActiveRecord::Migration[5.2]
  def change
    remove_column :carted_products, :integer, :string
    remove_column :carted_products, :order_id, :string
  end
end
