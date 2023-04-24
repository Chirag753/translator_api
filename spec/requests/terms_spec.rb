require_relative '../rails_helper'

RSpec.describe TermsController, type: :controller do
  describe 'POST #create' do
    let(:glossary) { create(:glossary) }
    let(:valid_attributes) { attributes_for(:term) }
    let(:invalid_attributes) { attributes_for(:term, source_term: nil) }

    context 'with valid params' do
      it 'creates a new term' do
        expect {
          post :create, params: { glossary_id: glossary.id, term: valid_attributes }
        }.to change(Term, :count).by(1)
      end

      it 'renders a JSON response with the new term' do
        post :create, params: { glossary_id: glossary.id, term: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.body).to include(valid_attributes[:source_term])
        expect(response.body).to include(valid_attributes[:target_term])
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new term' do
        post :create, params: { glossary_id: glossary.id, term: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.body).to include("Source term can't be blank")
      end
    end
  end
end
