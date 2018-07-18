class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products
  # def products
  #   products = []
  #   category_products.each do |category_product|
  #     products << category_product.product
  #   end
  #   products
  # end
end
