class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :post

  def total_price
    quantity * price 
  end

end
