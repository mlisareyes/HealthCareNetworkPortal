class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  has_many :notes

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :sex, presence: true

  scope :alpha, -> { order (:name) }

end
