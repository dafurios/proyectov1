class Driver < User

  belongs_to :enterprise, class_name: 'Enterprise', foreign_key: 'enterprise_id'

  # has_many :car_drivers, class_name: 'CarDriver', foreign_key: 'driver_id'

  # has_many :cars, through: :car_drivers

  # has_many :schools


end
