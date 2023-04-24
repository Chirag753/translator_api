Rails.application.routes.draw do
  resources :translations, only: [:create, :show]
  resources :glossaries, only: [:create, :index, :show] do
    resources :terms, only: [:create]
  end
end
