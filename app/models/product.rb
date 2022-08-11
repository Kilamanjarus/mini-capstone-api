class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def friendly_created_at
    return created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    if price < 10
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
  end
end
