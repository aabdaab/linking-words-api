class RemoveLanguageRefFromWord < ActiveRecord::Migration[5.0]
  def change
    remove_reference :words, :language, index: true, foreign_key: true
  end
end
