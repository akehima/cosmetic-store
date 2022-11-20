module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "Оплаченный"
    else
      "Неоплачиваемый"
    end
  end  
end
