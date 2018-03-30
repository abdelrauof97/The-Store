class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all
    @cart = current_cart
  end
end
