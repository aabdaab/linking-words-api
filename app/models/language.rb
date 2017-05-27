class Language < ApplicationRecord
  has_many :sections
  has_many :categories
  has_many :words, through: :sections
end
