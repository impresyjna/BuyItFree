class GoodsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :new]
  
  def new
    @good = Good.new
  end

  def show
   @good = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
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
  
  def update
    @good = Good.find(params[:id])
    if @good.update_attributes(good_update_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to my_products_path
    else
      render 'edit'
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
    
    def good_update_params
      params.require(:good).permit(:how_many, :photo, :category_id)
    end
    
end
