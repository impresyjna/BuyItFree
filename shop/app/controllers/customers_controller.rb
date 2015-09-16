class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def edit
    @customer = current_user.customer
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      current_user.customer = @customer
      flash[:success] = "Zapisano dane"
      redirect_to current_user
    else
      flash[:warning] = "Nie udało się zapisać danych" 
      render 'new'
    end
  end
  
  def update
    @customer = current_user.customer
    if @customer.update_attributes(customer_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  private

    def customer_params
      params.require(:customer).permit(:name, :surname, :address,
                                   :post_code, :city, :telephone)
    end
  
end
