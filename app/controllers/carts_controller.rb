class CartsController < ApplicationController

  before_action do
      if @current_user.nil?
        redirect_to sign_in_path
      end
    end

    def remove_from_cart
      order = Order.find_by status: 'cart', user_id: @current_user.id
      @post = Post.find_by id: params[:post_id]

      order_item = OrderItem.find_by order_id: order.id, post_id: @post.id
      order_item.destroy

      redirect_to cart_path
    end

    def add_to_cart


      @post = Post.find_by id: params[:post_id]

      order = Order.find_by status: 'cart', user_id: @current_user.id

      if order.nil?
        order = Order.new
        order.user = @current_user
        order.save!
      end

      order_item = OrderItem.find_by order_id: order.id, post_id: @post.id
      if order_item.present?
        order_item.quantity = order_item.quantity + 1
      else
        order_item = OrderItem.new
        order_item.order = order
        order_item.post = @post # what do I replace this with? It's nil
        order_item.price = @post.price
        order_item.shipping_cost = 0
        order_item.quantity = 1
      end
      order_item.save!
      redirect_to cart_path

    end

    def view

      @order = Order.find_by status: 'cart', user_id: @current_user.id
    end
  end
