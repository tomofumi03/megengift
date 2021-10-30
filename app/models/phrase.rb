class Phrase < ApplicationRecord
  validates :sentence, presence: true
end
