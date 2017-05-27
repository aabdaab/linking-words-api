class Word < ApplicationRecord
  belongs_to :section
  has_many :translations
  has_many :adnotations

  has_many :category_words
  has_many :categories, through: :category_words

  delegate :language, to: :section


  # def tags=(names)
  #   self.tags = names.split(",").map do |name|
  #     # how to add language which comes from a word?
  #     Category.where(name: name.strip, language: Language.find(params[:language_id])).first_or_create!
  #   end
  # end
  #
  # def tags
  #   self.tags.map(&:name).join(", ")
  # end
end
