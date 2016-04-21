class CheckoutController < ApplicationController
  before_action do
      if @current_user.nil?
        redirect_to sign_in_path
      end
    end

    def start
      @order = Order.find_by status: 'cart', user_id: @current_user.id
    end

    def process_payment
      @order = Order.find_by status: 'cart', user_id: @current_user.id
      @user=User.first
      card_token = params[:stripeToken]

      # Stripe.api_key = "sk_test_xIGhTi9JGwC0H65Tq1KdFEJE"
      #
      # Stripe::Charge.create(
      #   :amount => @order.total_price_in_cents,
      #   :currency => "usd",
      #   :source => card_token,
      #   :description => @order.description
      # )

      if @order.update status: 'pending'
        InstructionsMailer.instructions_email(@user).deliver
      redirect_to receipt_path(id: @order.id)
      else
        render :new
      end
    end

    def receipt
      @order = Order.find_by! id: params[:id], user_id: @current_user.id
    end
end
