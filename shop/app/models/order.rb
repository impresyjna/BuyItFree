class Order < ActiveRecord::Base
  belongs_to :order_state
  belongs_to :customer
  belongs_to :seller
  
  has_many :order_items, :dependent => :destroy
  
  validate :is_ok?
  
  def is_ok?
    if self.is_good?
      return true
    else
      return false
    end
  end
  
end
