class Store < ActiveRecord::Base
  has_many :employees
  validates_associated :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_line

  def must_carry_line
    if (!mens_apparel && !womens_apparel) then
      errors.add(:mens_apparel, "Store must carry a product line")
      errors.add(:womens_apparel, "Store must carry a product line")
    end

  end
end
