json.id @order.id
json.user_id @order.user_id
json.subtotal number_to_currency(@order.subtotal)
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total)

# json.user @order.user
# json.products @order.carted_products