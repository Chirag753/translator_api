require_relative '../rails_helper'

RSpec.describe Glossary, type: :model do
  describe 'validations' do
    subject { create(:glossary) }

    it { should validate_presence_of(:source_language_code) }
    it { should validate_presence_of(:target_language_code) }

    # it { should validate_uniqueness_of(:source_language_code).scoped_to(:target_language_code).with_message("The combination of source and target language must be unique") }
  end

  describe 'associations' do
    it { should have_many(:terms) }
  end
end
