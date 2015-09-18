class Good < ActiveRecord::Base
    has_attached_file :photo, styles: { small: "64x64", med: "100x100", large: "200x200" }
    belongs_to :user
    belongs_to :category
    
    VALID_FLOAT_REGEX = /\A[0-9\,]+\z/
    
    validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
    validates :title, presence: true, length: { maximum: 150 }
    validates :description, presence: true
    validates :price, presence: true, format: {with: VALID_FLOAT_REGEX }
    validates :how_many, :numericality => { :greater_than => 0 }
end
