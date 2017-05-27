class AddLanguageRefToWord < ActiveRecord::Migration[5.0]
  def change
    add_reference :words, :language, foreign_key: true
  end
end
