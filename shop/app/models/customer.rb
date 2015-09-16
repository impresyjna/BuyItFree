class Customer < ActiveRecord::Base
    belongs_to :user
  
    #validates :name,  presence: true, length: { maximum: 50 }
    VALID_POST_CODE_REGEX = /\d{2}-\d{3}\z/
    validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
  
end
