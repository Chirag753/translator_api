class Term < ApplicationRecord
  belongs_to :glossary
  validates :source_term, :target_term, presence: true
  validates :source_term, uniqueness: { scope: [:target_term, :glossary_id], message: "Translation already present in the glossary" }
end
