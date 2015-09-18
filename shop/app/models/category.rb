class Category < ActiveRecord::Base
    has_many :goods, dependent: :destroy
end
