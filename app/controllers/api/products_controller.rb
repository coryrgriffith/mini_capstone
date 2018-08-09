class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    # input_name = params[:client_search]
    # if input_name
    #   @products = Product.where('LOWER name LIKE ?', "%#{input_name.downcase}%").order(:id)
    # else
    #   @products = Product.all.order(:id)
    # end
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
      @products = Product.all
    end
    render "index.json.jbuilder"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      supplier_id: params[:input_supplier_id],
      description: params[:input_description]
    )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.supplier_id = params[:input_supplier_id] || @product.supplier_id
    @product.description = params[:input_description] || @product.description
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: {message: "You deleted the item."}
  end
end
