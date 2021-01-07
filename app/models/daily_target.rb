class DailyTarget < ApplicationRecord
  belongs_to :user

  validates :date_id, uniqueness: true

end
