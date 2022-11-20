module Account::ProductsHelper
  def crop(string)
    if string.length > 45
      string[0..45] + '...'
    else
      string
    end
  end
end
