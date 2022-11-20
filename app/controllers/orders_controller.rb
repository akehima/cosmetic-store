class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :pay]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price
    if session[:currency].present? 
      @currency_s = session[:currency]
    else 
      @currency_s = 'US Dollar'
    end
    @currency = Currency.find_by(name: @currency_s)
    @order.currency = @currency.symbol
    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.product_id = cart_item.product.id
        product_list.quantity = cart_item.quantity
        product_list.save
      end
      current_cart.clean!
      OrderMailer.notify_order_placed(@order).deliver!
      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
    @client_token = Braintree::ClientToken.generate
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.make_payment!
    redirect_to order_path(@order.token), notice: "Используйте Alipay для успешного завершения оплаты"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.make_payment!
    redirect_to order_path(@order.token), notice: "Используйте WeChat для успешного завершения оплаты"
  end

  def apply_to_cancel
    @order = Order.find_by_token(params[:id])
    OrderMailer.apply_cancel(@order).deliver!
    flash[:notice] = "Подано заявление"
    redirect_to :back
  end

  def pay_with_paypal
    @order = Order.find_by_token(params[:id])
    if @order
      nonce = params[:payment_method_nonce]
      result = Braintree::Transaction.sale(
        amount: @order.total,
        payment_method_nonce: nonce
      )
      if result
        
        @order.make_payment!
        redirect_to account_orders_path 
      else
        
        flash[:notice] = t('message-payment-failed')
      end
    else
      
      flash[:notice] = t('message-payment-failed')
    end
  end
  private

    def order_params
      params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address, :shipping_phone, :payment_method)
    end
end
