class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email , subject: "[COSMETICSTORE] Спасибо за выполнение этого заказа, на этот раз приведены данные о ваших покупках #{order.token}")
  end

  def apply_cancel(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists
    mail(to: "admin@test.com" , subject: "[COSMETICSTORE] пользователь #{order.user.email} - заявление о отмене заказа #{order.token}")
  end

  def notify_ship(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[COSMETICSTORE] заказ #{order.token} Отправлен")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists
    mail(to: @user.email, subject: "[COSMETICSTORE] Заказ #{order.token} отменен")
  end
end
