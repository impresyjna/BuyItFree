class Customer < ActiveRecord::Base
    belongs_to :user
  
    #validates :name,  presence: true, length: { maximum: 50 }
    VALID_POST_CODE_REGEX = /\d{2}-\d{3}\z/
    VALID_CITY_REGEX = /\A\D+\z/
    validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
    validates :city, presence: true, format: {with: VALID_CITY_REGEX }
  
end
