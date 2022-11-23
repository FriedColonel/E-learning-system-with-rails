class Course < ApplicationRecord
  has_many :enrolls, dependent: :delete_all
  has_many :users, through: :enrolls
  has_many :lessons
  validates :name, presence: true
  validates :description, presence: true

  def enrolling? user
    users.include? user
  end
end
