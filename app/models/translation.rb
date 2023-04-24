class Translation < ApplicationRecord
  belongs_to :glossary
  validates :source_language_code, presence: true
  validates :target_language_code, presence: true
  validates :source_text, presence: true
  validate :source_and_target_language_match_glossary_language, if: :glossary_id?
  validates :source_text, length: { maximum: 5000 }

  def translate
    text = self.source_text
    glossary = set_glossary
    if glossary.nil?
      self.errors.add(:glossary, "not found")
      return
    end
    self.glossary = glossary
    glossary_terms = glossary.terms
    glossary_terms.each do |term|
      source_term = term.source_term
      target_term = term.target_term
      text = text.gsub(source_term, "<HIGHLIGHT>#{target_term}</HIGHLIGHT>") if text.include?(source_term)
    end
    self.translated_text = text
  end

  private

  def set_glossary
    Glossary.find_by(id: self.glossary_id) || Glossary.where(source_language_code: self.source_language_code, target_language_code: self.target_language_code).take
  end

  def source_and_target_language_match_glossary_language
    unless glossary.source_language_code == source_language_code &&
           glossary.target_language_code == target_language_code
      errors.add(:glossary, "Source and target language must match the glossary language")
    end
  end
end
