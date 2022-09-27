class Word < ApplicationRecord
  belongs_to :lesson
  validates :origin, presence: true
  validates :hiragana, presence: true
  validates :meaning, presence: true
end
