class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  validates :date, presence: true
  validates :time, presence: true

  def self.from_today
    where('date ==?', Date.today)
  end

  def self.future_appointments
    where('date > ?', Date.today)
  end

end
