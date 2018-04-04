class AddReferenceToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :enterprise, index: true
    add_reference :users, :student, index: true
    add_reference :users, :tutor, index: true
    add_reference :users, :coordinator, index: true
    add_reference :users, :driver, index: true
  end
end
