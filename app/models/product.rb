class Product < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    product_price = price
    if product_price < 10
      return true
    else
      return false
    end
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
    # "nice"
  end
end
