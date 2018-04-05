class Commune < ApplicationRecord
  belongs_to :region
  has_many :tutors
  has_many :students

  # has_many :students
  # , class_name: 'Student', foreign_key: 'student_id'

end
