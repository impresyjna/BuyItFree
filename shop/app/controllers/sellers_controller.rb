class SellersController < ApplicationController
  def new
    @seller = Seller.new
  end

  def edit
  end
  
  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      current_user.seller = @seller
      flash[:success] = "Zapisano dane"
      redirect_to current_user
    else
      flash[:warning] = "Nie udało się zapisać danych" 
      render 'new'
    end
  end
  
  private

    def seller_params
      params.require(:seller).permit(:name, :surname, :address,
                                   :post_code, :city, :account_number, 
                                   :company_name, :company_address, 
                                   :company_post_code, :company_city, :regon, 
                                   :nip, :krs)
    end
  
end
