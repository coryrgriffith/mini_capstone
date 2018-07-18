json.id @order.id
json.user_id @order.user_id
json.product_id @order.product_id
json.quantity @order.quantity
json.subtotal number_to_currency(@order.subtotal)
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total)

json.user @order.user
json.product @order.product