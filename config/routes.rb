Rails.application.routes.draw do
  resources :user_restaurants
  # resources :restaurants
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/restaurants', to: 'yelp_api#restaurants'
  get '/restaurants/:id', to: 'yelp_api#restaurant'
  get '/restaurants/:id/reviews', to: 'yelp_api#restaurant_reviews'

end
