class Api::ProductsController < ApplicationController
  def display_all_action
    @products = Product.all
    render "display_all.json.jbuilder"
  end
end
