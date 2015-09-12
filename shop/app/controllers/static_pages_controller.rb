class StaticPagesController < ApplicationController
  def home
    @good = current_user.goods.build if logged_in?
  end

  def rules
  end

  def about
  end
  
  def contact
  end
  
end
