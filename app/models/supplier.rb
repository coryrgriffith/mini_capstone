class Supplier < ApplicationRecord
  def products
    Supplier.where(supplier_id: id)
  end
end
