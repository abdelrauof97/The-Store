class CartsController < ApplicationController

  before_action :authenticate_user!

  def show
    @cart = current_cart
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout
    @cart.save
    redirect_to cart_path(@cart)
  end

end
