Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'url_shortened#index'
  get "/:short_url", to: "url_shortened#show"
  get "shortened/:short_url", to: "url_shortened#shortened", as: :shortened
  resources :url_shortened, only: :create


  namespace :api, defaults: { format: 'json' } do
    namespace :v0 do
      resources :url_shortened, except: :update
    end
  end
end
