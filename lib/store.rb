class Store < ActiveRecord::Base
  has_many :employees

  validates_associated :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_line

  before_destroy :prevent_destroy

  private

    def must_carry_line
      if (!mens_apparel && !womens_apparel) then
        errors.add(:mens_apparel, :womens_apparel, "Store must carry a product line")
      end
    end

    def prevent_destroy
      self.employees.count == 0
    end

end
