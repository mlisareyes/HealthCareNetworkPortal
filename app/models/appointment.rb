class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  validates :date, presence: true
  validates :time, presence: true
end
