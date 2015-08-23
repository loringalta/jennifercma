Rails.application.routes.draw do
  resources :users
  resources :find_foods
  root                'sessions#login'
  # post   '/'       => 'foods#dashboard'
  get    'signup'              => 'static_pages#home'
  get    'login'               => 'sessions#new'
  post   'login'               => 'sessions#create'
  delete 'logout'              => 'sessions#destroy'
  get    'find_food/dashboard' => 'find_foods#dashboard'
  get    'find_food/food_info' => 'find_foods#food_info'
end
