class Employee < ActiveRecord::Base
  belongs_to :store

  validates :store_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }

  before_save :generate_password, on: :create

  private

    def generate_password
      self.password = ""
      chars = [*(0..9), *('a'..'z'), *('A'..'Z')]
      8.times do
        self.password += chars[rand(chars.length - 1)].to_s
      end
    end
  
end
