class CheckoutController < ApplicationController

    before_action do
      if @current_user.nil?
        redirect_to sign_in_path
    end

  def start
    @order=Order.find_by status: 'cart', user_id: @current_user.id

  end

  def process_payment
    @order=Order.find_by status: 'cart', user_id: @current_user.id
    @order.update status: 'delivering'
    redirect_to receipt_path
  end
  def receipt
    @order=Order.find_by! id: params[:order_id], user_id: @current_user.id
  end
end
