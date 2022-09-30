class User < ApplicationRecord
  has_many :enrolls
  has_many :courses, through: :enrolls
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
                   length: {maximum: Settings.validate.user.name.max_length}
  validates :username, presence: true,
                       length: {maximum: Settings.validate.user.username.max_length},
                       format: {with: Settings.validate.user.username.regex}
  def enroll course
    courses << course
  end
end
