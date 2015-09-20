class SellersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy, :new, :show, :index]
  
  def new
    @seller = Seller.new
  end

  def edit
    @seller = current_user.seller
  end
  
  def create
    @seller = Seller.new(seller_params)
    @customer = Customer.new(customer_params)
    @customer.save
    if @seller.save
      current_user.seller = @seller
      current_user.customer = @customer
      flash[:success] = "Zapisano dane"
      redirect_to current_user
    else
      flash[:warning] = "Nie udało się zapisać danych" 
      render 'new'
    end
  end
  
  def update
    @seller = current_user.seller
    if @seller.update_attributes(seller_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  def index
    @sellers = Seller.all
  end
  
  private

    def seller_params
      params.require(:seller).permit(:name, :surname, :address,
                                   :post_code, :city, :telephone,  :account_number, 
                                   :company_name, :company_address, 
                                   :company_post_code, :company_city, :company_number)
    end
    
    def customer_params
      params.require(:seller).permit(:name, :surname, :address,
                                   :post_code, :city, :telephone)
    end
  
end
