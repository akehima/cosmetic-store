class WelcomeController < ApplicationController
  layout "welcome"

  def index
    @intros = Intro.published
    @featured_products = Product.last(8)
  end
end
