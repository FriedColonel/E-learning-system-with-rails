class Word < ApplicationRecord
  belongs_to :lesson
  has_many :examples, dependent: :delete_all

  validates :origin, presence: true
  validates :hiragana, presence: true
  validates :meaning, presence: true
end
