class OrdersController < ApplicationController
  def index
    @orders = Order.where("status !=?", 'cart')
  end

  def show
    @order = Order.find_by id: params[:id]
  end
end
