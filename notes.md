HealthCare Network Portal

class User
  has_many :appointments
  has_many :patients, through: :appointments

  has_many :notes
  has_many :noted_patients, through: :notes, source: :patients

  ATTRIBUTES:
  -name
  -username
  -password_digest

  VALIDATES:
  -validates :name, presence: true
  -validates :username, presence: true
  -validates :username, uniqueness: true
  -validates :password, length: { in: 6..20 }

Appointment
  belongs_to :user
  belongs_to :patient
  -user_id - integer
  -patient_id - integer
  -appointment_date - datetime


Patient
  has_many :appointments
  has_many :users, through: :appointments

  has_many :notes
  has_many :users, through: :notes

  ATTRIBUTES:
  -name
  -birthdate
  -gender
  -notes with dates?

  VALIDATES:
  name, presence, true
  birthdate, presence true
  gender, presence true

Notes
  belongs_to :user
  belongs_to :patients

  content
