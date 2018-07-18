class Product < ApplicationRecord
  has_many :orders
  has_many :category_products
  
  def is_discounted?
    price < 50
  end

  def tax
    tax_amount = price * 0.09
    tax_amount.round(2)
  end

  def total
    total_price = price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def images
    Image.where(product_id: id)
  end
end
