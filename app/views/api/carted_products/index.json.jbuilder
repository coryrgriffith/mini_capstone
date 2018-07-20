json.array! @carted_products.each do |carted_product|
  json.id carted_product.id
  json.user_id carted_product.user_id
  json.product_id carted_product.product_id
  json.quantity carted_product.quantity
  json.status carted_product.status
  json.cartedproduct do
    json.subtotal carted_product.product.subtotal
    json.tax carted_product.product.tax
    json.total carted_product.product.total
  end
  json.user carted_product.user
  json.product carted_product.product
end