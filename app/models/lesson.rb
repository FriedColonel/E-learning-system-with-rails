class Lesson < ApplicationRecord
  belongs_to :course
  has_many :words, dependent: :delete_all
  has_one :test

  validates :name, presence: true
end
