class Product < ApplicationRecord
  belongs_to :suppliers
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greaterthan: 0}
  validates :description, presence: true
  validates :description, length: {in: 10..500}

  def is_discounted?
    price < 50
  end

  def subtotal
    price
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
