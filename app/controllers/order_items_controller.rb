class OrderItemsController < ApplicationController
  class OrderItemsController < ApplicationController
    def create
      @order = Order.find(params[:order_id])
      @item = Item.find(params[:item_id])

      # Crea un nuevo objeto OrderItem y lo asocia con la orden y el ítem
      @order_item = OrderItem.new(order: @order, item: @item)

      if @order_item.save
        # La adición al pedido fue exitosa
        redirect_to @order, notice: 'El ítem ha sido agregado al pedido.'
      else
        # Hubo un error al agregar el ítem al pedido
        redirect_to @order, alert: 'Hubo un error al agregar el ítem al pedido.'
      end
    end
  end
end
