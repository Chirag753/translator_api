# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

glossary = Glossary.find_or_create_by(source_language_code: 'en', target_language_code: 'es')

term = glossary.terms.find_or_create_by(source_term: 'recruitment', target_term: 'reclutamiento')

translation = Translation.new(source_language_code: 'en', target_language_code: 'es', source_text: 'This is a recruitment task')

translation.translate

translation.save
