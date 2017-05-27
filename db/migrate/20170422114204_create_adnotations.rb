class CreateAdnotations < ActiveRecord::Migration[5.0]
  def change
    create_table :adnotations do |t|
      t.text :phrase
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
