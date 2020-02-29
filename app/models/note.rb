class Note < ApplicationRecord
  belongs_to :user
  belongs_to :patient

  validates :content, presence: true
end
