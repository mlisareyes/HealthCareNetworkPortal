class User < ApplicationRecord
  has_secure_password #authenticate, validate password and/or password confirmation

  has_many :appointments
  has_many :patients, through: :appointments
  has_many :notes
  has_many :noted_patients, through: :notes, source: :patient

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }
end
