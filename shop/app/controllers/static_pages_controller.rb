class StaticPagesController < ApplicationController
  def home
    @good = current_user.goods.build if logged_in?
    @categories = Category.all 
  end

  def help
        @categories = Category.all 
  end

  def rules
        @categories = Category.all 
  end

  def about
        @categories = Category.all 
  end
  
  def contact
        @categories = Category.all 
  end
  
end
