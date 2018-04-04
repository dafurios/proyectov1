class Enterprise < User

  has_many :drivers, class_name: 'Driver', foreign_key: 'enterprise_id', dependent: :destroy

  has_many :cars, class_name: 'Car', foreign_key: 'user_id', dependent: :destroy

  # has_many :car_drivers, class_name: 'CarDriver', foreign_key: 'driver_id', dependent: :destroy

  # has_many :schools



end
