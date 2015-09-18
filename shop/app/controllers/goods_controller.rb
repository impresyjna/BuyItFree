class GoodsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :new]
  
  def new
    @good = Good.new
  end

  def show
   @good = Good.find(params[:id])
  end

  def edit
  end

  def index
    @goods = Good.paginate(page: params[:page])
  end
  
  def create
    @good = current_user.goods.create(good_params)
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
                                   :how_many, :photo, :category_id)
    end
    
end
