Rails.application.routes.draw do
  resources :user_restaurants
  resources :users

  # USER CREATION AND AUTHENTICATION
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  patch '/users/:id', to: 'users#update' #TODO 
  delete '/users/:id', to: 'users#destroy' #TODO

  post '/signin', to: 'users#signin' #TODO 
  get '/validate', to: 'users#validate' #TODO


  # RESTAURANTS API
  get '/restaurants', to: 'yelp_api#restaurants'
  get '/restaurants/:business_id', to: 'yelp_api#restaurant'
  get '/restaurants/:id/reviews', to: 'yelp_api#restaurant_reviews'

end
