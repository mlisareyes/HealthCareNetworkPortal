class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# 
# User -> appointment -> patient -> note
#                 ^   note  ^
#
# User has_many :notes, through: :patients
# Patient has_many :notes
# Note belongs_to :user
#      belongs_to :patient
