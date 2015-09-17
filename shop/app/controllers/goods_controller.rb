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
    @good = current_user.goods.build(good_params)
    if @good.save
      flash[:success] = "Dodano produkt"
      redirect_to current_user
    else
      flash[:warning] = "Nie udało się dodać produktu" 
      render 'new'
    end
  end
  
  def mine
    @goods = current_user.goods.paginate(page: params[:page])
  end
  
  private

    def good_params
      params.require(:good).permit(:title, :price, :description,
                                   :how_many, :photo)
    end
    
end
