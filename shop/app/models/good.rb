class Good < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 255 }
    validates :price, presence: true
    validates :description, presence: true
    validates :how_many, presence: true
end
