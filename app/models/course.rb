class Course < ApplicationRecord
  has_many :enrolls, dependent: :delete_all
  has_many :users, through: :enrolls

  def enrolling? user
    users.include? user
  end
end
