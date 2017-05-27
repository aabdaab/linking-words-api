class CategoryWord < ApplicationRecord
  belongs_to :category
  belongs_to :word
end
