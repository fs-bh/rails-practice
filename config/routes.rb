Rails.application.routes.draw do
  get 'author/index'
  get 'author/new'
  get 'author/create'
  get 'author/show'
  get 'author/edit'
  get 'author/update'
  get 'author/delete'
  resources :books
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
