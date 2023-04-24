require_relative '../rails_helper'

RSpec.describe Translation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:source_language_code) }
    it { should validate_presence_of(:target_language_code) }
    it { should validate_presence_of(:source_text) }
    it { should validate_length_of(:source_text).is_at_most(5000) }

    context 'when glossary is present' do
      let(:glossary) { create(:glossary) }
      let(:translation) { build(:translation, glossary: glossary) }

      it 'is valid when source and target language match glossary language' do
        expect(translation).to be_valid
      end

      it 'is invalid when source and target language do not match glossary language' do
        translation.source_language_code = 'es'
        expect(translation).to be_invalid
        expect(translation.errors[:glossary]).to include('Source and target language must match the glossary language')
      end
    end
  end

  describe '#translate' do
    let(:glossary) { create(:glossary) }
    let(:translation) { create(:translation, glossary: glossary, source_text: 'Hello world!') }

    it 'replaces glossary terms with highlighted target terms' do
      create(:term, glossary: glossary, source_term: 'Hello', target_term: 'Hola')
      create(:term, glossary: glossary, source_term: 'world', target_term: 'mundo')
      translation.translate
      expect(translation.translated_text).to eq('<HIGHLIGHT>Hola</HIGHLIGHT> <HIGHLIGHT>mundo</HIGHLIGHT>!')
    end
  end
end
