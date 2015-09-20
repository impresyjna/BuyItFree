class OrderItem < ActiveRecord::Base
  belongs_to :basket
  belongs_to :user
  belongs_to :good
end
