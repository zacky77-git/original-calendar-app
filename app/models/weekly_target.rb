class WeeklyTarget < ApplicationRecord
  belongs_to :user

  validates :week_id, uniqueness: true
end
