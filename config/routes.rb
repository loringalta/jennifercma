Rails.application.routes.draw do
  resources :find_foods, except: [:new, :edit]
  resources :users
  root to:                        'static_pages#home'
  put    'find_food/update'    => 'find_foods#update'
  get    'find_food/dashboard' => 'find_foods#dashboard'
  get    'find_food/food_info' => 'find_foods#food_info'
  delete 'find_food/delete'    => 'find_foods#destroy'
end
