class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true


  has_many :tasks, dependent: :destroy
  has_many :monthly_target
  has_many :weekly_target
  has_many :daily_target
end
