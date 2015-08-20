Rails.application.routes.draw do
  resources :users
  resources :find_foods
  get 'users/new'
  root                'static_pages#home'
  # post   '/'       => 'foods#dashboard'
  get    'signup'              => 'users#new'
  get    'login'               => 'sessions#new'
  post   'login'               => 'sessions#create'
  delete 'logout'              => 'sessions#destroy'
  get    'find_food/dashboard' => 'find_foods#dashboard'
  get    'find_food/food_info' => 'find_foods#food_info'
end
