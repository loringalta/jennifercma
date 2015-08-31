Rails.application.routes.draw do
  resources :find_foods, except: [:new, :edit]
  resources :users
  root                            'sessions#new'
  put    'find_food/update'     => 'find_foods#update'
  post   'signup'               => 'users#new'
  get    'login'                => 'sessions#new'
  post   'login'                => 'sessions#create'
  delete 'logout'               => 'sessions#destroy'
  post   'signup'               => 'users#new'
  get    'signup'               => 'sessions#new'
  # get    'logout'              => 'sessions#destroy'
  get    'find_food/dashboard' => 'find_foods#dashboard'
  get    'find_food/food_info' => 'find_foods#food_info'
  delete 'find_food/delete'    => 'find_foods#destroy'
end
