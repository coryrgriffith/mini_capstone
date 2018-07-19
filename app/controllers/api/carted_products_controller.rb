class Api::CartedProductsController < ApplicationController
  def index
    if current_user
      @carted_products = current_user.carted_products
      render "index.json.jbuilder"
    else
      render json: ["Currently nothing in your cart"]
    end
  end

  def show
    carted_product_id = params[:id]
    @carted_product = CartedProduct.find_by(id: carted_product_id)
    render "show.json.jbuilder"
  end

  def create
    

    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted",
      order_id: params[:id]
    )
    @carted_product.save
    render "show.json.jbuilder"
  end
end
