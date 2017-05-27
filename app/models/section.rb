class Section < ApplicationRecord
  belongs_to :language
  has_many :words
end
