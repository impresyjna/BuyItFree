class OrderItemsController < ApplicationController
  def new
    @order_item = OrderItem.new
    @order_item.good_id = params[:good_id]
    @item = Good.find(@order_item.good_id)
    @order = Order.new
  end

  def show
  end

  def update
  end

  def edit
  end

  def create
    @order = Order.new()
    @order.save
    @order_item = current_user.order_items.create(order_item_params)
    @order_item = @order.order_items.create(order_item_params)
    if @order_item.save
      redirect_to edit_order_path(@order.id, :send_way_id => params[:order_item][:order][:send_way_id])
    else
      flash[:warning] = "Nie udało się zamówić" 
      render 'new'
    end
  end

  def destroy
  end
  
  
  private
      def order_item_params
        params.require(:order_item).permit(:good_id, :how_many, order_attributes: [:send_way_id])
      end
  
      def order_params
        params.require(:order).permit(:send_way_id)
      end
end
