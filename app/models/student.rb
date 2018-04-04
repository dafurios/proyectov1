class Student < ApplicationRecord

  belongs_to :tutor, class_name: 'User', foreign_key: 'user_id'

  # belongs_to :commune, class_name: 'Commune', foreign_key: 'commune_id'
  # belongs_to :school, class_name: 'School', foreign_key: 'school_id'

  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode

end
