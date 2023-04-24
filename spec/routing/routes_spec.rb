require_relative '../rails_helper'

RSpec.describe 'Routes', type: :routing do
  describe 'Translations routes' do
    it 'routes POST /translations to translations#create' do
      expect(post: '/translations').to route_to('translations#create')
    end

    it 'routes GET /translations/:id to translations#show' do
      expect(get: '/translations/1').to route_to('translations#show', id: '1')
    end
  end

  describe 'Glossaries routes' do
    it 'routes POST /glossaries to glossaries#create' do
      expect(post: '/glossaries').to route_to('glossaries#create')
    end

    it 'routes GET /glossaries to glossaries#index' do
      expect(get: '/glossaries').to route_to('glossaries#index')
    end

    it 'routes GET /glossaries/:id to glossaries#show' do
      expect(get: '/glossaries/1').to route_to('glossaries#show', id: '1')
    end

    it 'routes POST /glossaries/:glossary_id/terms to terms#create' do
      expect(post: '/glossaries/1/terms').to route_to('terms#create', glossary_id: '1')
    end
  end
end