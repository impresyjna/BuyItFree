class Order < ActiveRecord::Base
  belongs_to :order_state
  belongs_to :customer
  belongs_to :seller
  
  has_many :order_items, :dependent => :destroy
end
