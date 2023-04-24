class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.string :source_language_code
      t.string :target_language_code
      t.string :source_text
      t.string :translated_text
      t.references :glossary, null: true, foreign_key: true

      t.timestamps
    end
  end
end
