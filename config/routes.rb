Rails.application.routes.draw do
  # resources :short_urls
  post '/', to: 'short_urls#create'
  get '/', to: 'short_urls#index'
  get '/:short', to: 'short_urls#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
