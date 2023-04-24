require_relative '../rails_helper' 

RSpec.describe GlossariesController, type: :controller do
  describe 'GET #index' do
    let!(:glossary) { create(:glossary) }

    it 'returns a success response' do
      get :index, format: :json
      expect(response).to be_successful
    end

    it 'includes terms in response' do
      get :index, format: :json
      expect(response.body).to include('terms')
    end
  end

  describe 'GET #show' do
    let!(:glossary) { create(:glossary) }

    it 'returns a success response' do
      get :show, params: { id: glossary.id }, format: :json
      expect(response).to be_successful
    end

    it 'includes terms in response' do
      get :show, params: { id: glossary.id }, format: :json
      expect(response.body).to include('terms')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:glossary) }

      it 'creates a new Glossary' do
        expect {
          post :create, params: { glossary: valid_attributes }, format: :json
        }.to change(Glossary, :count).by(1)
      end

      it 'renders a JSON response with the new glossary' do
        post :create, params: { glossary: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(glossary_url(Glossary.last))
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:glossary, source_language_code: nil) }

      it 'renders a JSON response with errors for the new glossary' do
        post :create, params: { glossary: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.body).to include("Source language code can't be blank")
      end
    end
  end
end