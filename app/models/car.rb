class Car < ApplicationRecord

  belongs_to :enterprise, class_name: 'Enterprise', foreign_key: 'user_id'

end
