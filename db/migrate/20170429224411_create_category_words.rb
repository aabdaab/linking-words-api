class CreateCategoryWords < ActiveRecord::Migration[5.0]
  def change
    create_table :category_words do |t|
      t.references :word, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
