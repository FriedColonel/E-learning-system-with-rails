class Lesson < ApplicationRecord
  belongs_to :course
  has_many :words, dependent: :delete_all

  validates :name, presence: true
end
