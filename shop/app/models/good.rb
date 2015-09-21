class Good < ActiveRecord::Base
    has_attached_file :photo, styles: { small: "64x64", med: "100x100", large: "500x500" }
    belongs_to :user
    belongs_to :category
    has_many :order_items
    has_many :send_ways, :dependent => :destroy
    
    accepts_nested_attributes_for :send_ways, :reject_if => :all_blank, :allow_destroy => true
    
    VALID_FLOAT_REGEX = /\A[0-9]+[,|.]*[0-9]{0,2}\z/
    
    validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
    validates :title, presence: true, length: { maximum: 150 }
    validates :description, presence: true
    validates :price, presence: true, :numericality => { :greater_than => 0 }
    validates :how_many, :numericality => { :greater_than => -1 }
    validates :photo, presence: true
end
