class Order < ActiveRecord::Base
  belongs_to :order_state
  belongs_to :customer
  belongs_to :seller
end
