class Tutor < User

  has_many :students, class_name: 'Student', foreign_key: 'user_id', dependent: :destroy
  belongs_to :commune 

end
