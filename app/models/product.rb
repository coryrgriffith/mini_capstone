class Product < ApplicationRecord
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
end
