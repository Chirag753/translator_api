require_relative '../rails_helper'

RSpec.describe Term, type: :model do
  describe 'validations' do
    subject { create(:term, glossary: create(:glossary)) }

    it { should validate_presence_of(:source_term) }
    it { should validate_presence_of(:target_term) }
  end

  describe 'associations' do
    it { should belong_to(:glossary) }
  end
end
