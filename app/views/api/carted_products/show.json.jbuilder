json.id @carted_product.id
json.user_id @carted_product.user_id
json.product_id @carted_product.product_id
json.quantity @carted_product.quantity
# json.subtotal number_to_currency(@carted_product.product.subtotal)
# json.tax number_to_currency(@carted_product.product.tax)
# json.total number_to_currency(@carted_product.product.total)

json.user @carted_product.user
json.product @carted_product.product