class User < ApplicationRecord
  has_secure_password #authenticate, validate password and/or password confirmation

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :notes


  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
end
