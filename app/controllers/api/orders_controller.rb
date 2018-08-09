class Api::OrdersController < ApplicationController
  def index
    @orders = Order.all
    render "index.json.jbuilder"
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  def create
    # product = Product.find_by(id: params[:input_product_id])
    # calculated_subtotal = params[:input_quantity].to_i * product.price
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_tax + calculated_subtotal

    # @order = Order.new(
    #   product_id: params[:input_product_id],
    #   quantity: params[:input_quantity],
    #   user_id: current_user.id,
    #   subtotal: calculated_subtotal,
    #   tax: calculated_tax,
    #   total: calculated_total
    @carted_products = current_user.carted_products.where(status: 'Carted')

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.status = 'Purchased'
      carted_product.order_id = @order.id
      carted_product.save
    end

    render "show.json.jbuilder"
  end
end
