# spec/factories.rb
FactoryBot.define do
  factory :glossary do
    source_language_code { 'en' }
    target_language_code { 'fr' }

  end
end

FactoryBot.define do
  factory :term do
    source_term { 'hello' }
    target_term { 'bonjour' }
    glossary
  end
end

FactoryBot.define do
  factory :translation do
    source_language_code { 'en' }
    target_language_code { 'fr' }
    source_text { 'Hello, world!' }
    glossary
    after(:build) do |translation|
      translation.translate
    end
  end
end
