Rails.application.routes.draw do
  resources :find_foods, except: [:new, :edit]
  resources :users
  root                            'sessions#login'
  put   'find_food/update'     => 'find_foods#update'
  get    'signup'              => 'static_pages#home'
  get    'login'               => 'sessions#new'
  post   'login'               => 'sessions#create'
  delete 'logout'              => 'sessions#destroy'
  get    'find_food/dashboard' => 'find_foods#dashboard'
  get    'find_food/food_info' => 'find_foods#food_info'
  delete 'find_food/delete'    => 'find_foods#destroy'
end
