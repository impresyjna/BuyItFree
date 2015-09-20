class SendWay < ActiveRecord::Base
  belongs_to :good
  
  #validates :name, presence: true
  #validates :price, presence: true, :numericality => { :greater_than => 0 }
  #validates :how_many_days, :numericality => { :greater_than => 0 }
end
