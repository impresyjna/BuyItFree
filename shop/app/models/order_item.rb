class OrderItem < ActiveRecord::Base
  belongs_to :basket
  belongs_to :user
  belongs_to :good
  
  validates :how_many, presence: true, :numericality => { :greater_than => 0 }
  #validates :how_many, :numericality => { :less_than_or_equal_to => :in_storage, :message => "Nie można zamówić więcej niż w magazynie" }
  
  def in_storage
    good.how_many
  end
end
