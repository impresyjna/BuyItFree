class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  
  def index
  end

  def new
  end

  def create
  end
  
  def destroy
    
  end

  def edit
    @order = Order.find(params[:id])
    @ordered_items = @order.order_items
    @send_way = SendWay.find(params[:send_way_id])
    @total_count = @order.order_items.sum(:how_many)
    @total_amount = 0
    @ordered_items.each do |o|
      @good = Good.find(o.good_id)
      @total_amount = @total_amount + @good.price * o.how_many
      @seller = Seller.find_by(user_id: @good.user_id)
    end
    @total_amount = @total_amount + @send_way.price
    
  end

  def update
        @order = Order.find(params[:id])
        @order_bool = true
            @ordered_items = @order.order_items
            @ordered_items.each do |o|
              @good = Good.find(o.good_id)
                @good.how_many = @good.how_many - o.how_many
                if !@good.save
                  @order_bool = false
                end
                  #flash[:danger] = "Towar został już wykupiony"
                 # redirect_to root_url
                #end
            end
            
        if @order.update_attributes!(order_params) and @order_bool
          flash[:success] = "Zamówienie zostało zgłoszone do realizacji"
          redirect_to @order
        else
          flash[:danger] = "Towar został wyprzedany"
          redirect_to root_url
        end
  end

  def show
    @order = Order.find(params[:id])
    @seller = Seller.find(@order.seller_id)
  end
  
  def my_orders
    @orders = Order.where("customer_id= ? AND order_state_id > ? AND is_good = 't'",  current_user.id,1 )
  end
  
  def customers_orders
    @orders = Order.where("seller_id= ? AND order_state_id > ? AND is_good = 't'", Seller.find_by(user_id: current_user).id,1 )
  end
  
  def change_state
    @order = Order.find(params[:order_id])
  end
  
  private
      def order_params
        params.require(:order).permit(:customer_id, :seller_id, :send_way_id, :total_price, :total_count, :order_state_id).merge(is_good: @order_bool)
      end
end
