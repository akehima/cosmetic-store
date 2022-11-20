module Admin::ProductsHelper
  def render_product_status(product)
    if product.is_hidden
      content_tag(:span, "", :class => "fa fa-lock fa-fw")
    else
      content_tag(:span, "", :class => "fa fa-globe fa-fw")
    end
  end

  def render_product_publish_or_hide(product)
    if product.is_hidden
      link_to(t('btn-publish'), publish_admin_product_path(product), :method => :post, :class => 'btn btn-sm btn-default')
    else
      link_to(t('btn-hide'), hide_admin_product_path(product), :method => :post, :class => 'btn btn-sm btn-default')
    end
  end

  def render_product_chosen_status(product)
    if product.is_chosen
      content_tag(:span, "", :class => "fa fa-heart fa-fw")
    end
  end
end
