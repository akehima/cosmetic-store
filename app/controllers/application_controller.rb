class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_currency
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: t('warning-not-admin')
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def set_currency
    if params[:currency]
      session[:currency] = params[:currency]
    end
  end

  private

  def find_cart
    cart = current_user&.cart
    if cart.blank? && current_user
      cart = Cart.create
      current_user.cart = cart
      session[:cart_id] = cart.id
      return cart
    elsif cart && current_user
      return cart
    end
  end
end
