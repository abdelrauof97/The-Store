class LineItemsController < ApplicationController

  def create
    current_cart.line_items << current_cart.add_item(params[:item_id])
    redirect_to cart_path(current_cart)
  end

end
