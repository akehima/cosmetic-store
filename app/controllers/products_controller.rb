class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_wish_list, :remove_from_wish_list]

  def index
    @category_groups = CategoryGroup.published
    @brands = Brand.published
    @q = Product.ransack(params[:q])
    products_ransack = @q.result

    if params[:category].present?
      @category_s = params[:category]
      @category = Category.find_by(name: @category_s)
      @products = products_ransack.where(:category => @category.id).published.recent.paginate(:page => params[:page], :per_page => 12)
    elsif params[:group].present?
      @group_s = params[:group]
      @group = CategoryGroup.find_by(name: @group_s)
      @products = products_ransack.joins(:category).where("categories.category_group_id" => @group.id).published.recent.paginate(:page => params[:page], :per_page => 12)
    elsif params[:brand].present?
      @brand_s = params[:brand]
      @brand = Brand.find_by(name: @brand_s)
      @products = products_ransack.where(:brand => @brand.id).published.recent.paginate(:page => params[:page], :per_page => 12)
    elsif params[:chosen].present?
      @products = products_ransack.where(:is_chosen => true).published.recent.paginate(:page => params[:page], :per_page => 12)
    else
      @products = products_ransack.published.recent.paginate(:page => params[:page], :per_page => 12)
    end
  end

  def show
    @product = Product.find(params[:id])
    @product_images = @product.product_images.all
    @orderSum = ProductList.where("product_id" => @product.id).sum(:quantity)
    @product_stock = @product.quantity - @orderSum
    @suggests = Product.published.random3
    @category_groups = CategoryGroup.published
    @brands = Brand.published
    @currencies = Currency.all

    set_page_title       @product.title
    set_page_description @product.description
    set_page_keywords    @product.title
    set_page_image       @product.product_images&.first&.image&.main&.url || ActionController::Base.helpers.image_tag('default_image.png')
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product, params['quantity'])
      flash[:notice] = t('message-add-to-cart-success')
    else
      flash[:warning] = t('message-already-added')
    end
    redirect_to :back
  end

  def setup_currency
    set_currency
    redirect_to :back
  end

  def add_to_wish_list
    @product = Product.find(params[:id])
    if !current_user.is_wish_list_owner_of?(@product)
      current_user.add_to_wish_list!(@product)
    end
    redirect_to :back
  end

  def remove_from_wish_list
    @product = Product.find(params[:id])
    if current_user.is_wish_list_owner_of?(@product)
      current_user.remove_from_wish_list!(@product)
    end
    redirect_to :back
  end

  def search
    query_string = params['keyword']
    if query_string.present?
      search_result = Product.where('lower(title) LIKE ?', "%#{query_string.downcase}%")
      @products = search_result.published.recent.paginate(:page => params[:page], :per_page => 12 )
    end

    @category_groups = CategoryGroup.published
    @brands = Brand.published
  end

  protected

    def validate_search_key
      @query_string = params[:keyword].gsub(/\\|\'|\/|\?/, "") if params[:keyword].present?
      @search_criteria = search_criteria(@query_string)
    end

    def search_criteria(query_string)
      { :name_or_description_or_brand_name_cont => query_string }
    end
end
