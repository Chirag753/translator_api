require_relative '../rails_helper'

RSpec.describe TranslationsController, type: :controller do
  let(:glossary) { create(:glossary) }
  let(:valid_params) { attributes_for(:translation, glossary_id: glossary.id) }
  let(:invalid_params) { attributes_for(:translation, glossary_id: glossary.id, source_text: nil) }

  describe "GET #show" do
    it "returns http success" do
      translation = create(:translation)
      get :show, params: { id: translation.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Translation" do
        expect {
          post :create, params: { translation: valid_params }
        }.to change(Translation, :count).by(1)
      end

      it "renders a JSON response with the new translation" do
        post :create, params: { translation: valid_params }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(translation_url(Translation.last))
      end
    end

    context "with invalid params" do
      it "does not create a new Translation" do
        expect {
          post :create, params: { translation: invalid_params }
        }.to_not change(Translation, :count)
      end

      it "renders a JSON response with errors for the new translation" do
        post :create, params: { translation: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include("Source text can't be blank")
      end
    end
  end
end
