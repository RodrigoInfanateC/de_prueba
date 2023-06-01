class OrdersController < ApplicationController
  def add_to_order
    @order = Order.find(params[:order_id])
    @item = Item.find(params[:item_id])

    # Agrega el item al pedido
    @order.items << @item

    # Actualiza el monto total del pedido
    @order.update_total_amount

    # Genera la respuesta para el AJAX
    response = {
      selectedItems: render_to_string(partial: 'selected_items', locals: { items: @order.items }),
      totalAmount: @order.total_amount
    }
    render json: response
  end
end

