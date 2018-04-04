class School < ApplicationRecord

  belongs_to :commune

  # has_many :students
  # , class_name: 'Student', foreign_key: 'student_id'
end
