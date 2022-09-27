class Example < ApplicationRecord
  belongs_to :word
  validates :hiragana, presence: true
  validates :meaning, presence: true
  validates :sentence, presence: true
end
