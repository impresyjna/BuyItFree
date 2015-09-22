class SendWay < ActiveRecord::Base
  belongs_to :good
  
  validates :name, presence: true, if: :not_exists?
  validates :price, presence: true, :numericality => { :greater_than => 0 }, if: :not_exists?
  validates :how_many_days, :numericality => { :greater_than => 0 }, if: :not_exists?
  
  def not_exists?
    if good.nil?
      return true
    else
      if good.send_ways[0].nil?
        return true
      else
        if good.send_ways[0].name.nil? or good.send_ways[0].how_many_days.nil? or good.send_ways[0].price.nil?
          return true
        else
          return false
        end
      end
    end
  end
  
end
