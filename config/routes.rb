Rails.application.routes.draw do
  resources :find_foods, except: [:new, :edit]
  root to:                        'static_pages#home'
  post   'find_foods/add'       => 'find_foods#add'
end
