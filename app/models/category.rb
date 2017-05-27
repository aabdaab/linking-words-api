class Category < ApplicationRecord
  belongs_to :language
  has_many :category_words
  has_many :words, through: :category_words
end
