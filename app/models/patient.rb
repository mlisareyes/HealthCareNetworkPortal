class Patient < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  # has_many :notes
  # has_many :users_notes, through: :notes, source: :user
  has_many :notes

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true

  scope :alpha, -> { order (:name) }

end
