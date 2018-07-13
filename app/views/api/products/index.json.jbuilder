json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.tax product.tax
  json.total_price product.total
  json.discounted product.is_discounted?
  json.description product.description
  json.supplier product.supplier
  json.images product.images
end