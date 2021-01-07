class MonthlyTarget < ApplicationRecord
  belongs_to :user

  validates :month_id, uniqueness: true

end
