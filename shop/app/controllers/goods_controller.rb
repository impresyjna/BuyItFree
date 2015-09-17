class GoodsController < ApplicationController
  def new
    @good = Good.new
  end

  def show
  end

  def edit
  end

  def index
  end
  
  def create
    @good = Good.new(good_params)
    if @good.save
      flash[:success] = "Dodano produkt"
      redirect_to current_user
    else
      flash[:warning] = "Nie udało się dodać produktu" 
      render 'new'
    end
  end
  
  private

    def good_params
      params.require(:good).permit(:title, :price, :description,
                                   :how_many, :photo)
    end
    
end
