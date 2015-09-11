class GoodsController < ApplicationController
    before_action :logged_in_user
    
    def create
        @good = current_user.goods.build(good_params)
        if @good.save
          flash[:success] = "Good created!"
          redirect_to root_url
        else
          render 'static_pages/home'
        end
    end

    def destroy
    end
    
    private
    
    def good_params
      params.require(:good).permit(:title, :description, :price, :how_many)
    end
  
end
