Rails.application.routes.draw do
  resources :chapters
  resources :users
  resources :cartoons
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'main', to: 'main#main'
  get 'genre', to: 'main#genre'
  get 'cartoon', to: 'main#allcartoons'

  get 'sign_up', to: 'registration#new'
  post 'sign_up', to: 'registration#create'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'

  get 'admin/update/cartoon', to: 'main#update'
  post 'admin/update/cartoon', to: 'main#update'

  delete 'logout', to: 'session#destroy'

  get 'search', to: 'main#search'

  get ":name" , to:"main#cartoon"
  get ":name/:chapter" , to:"main#chapter"

  post 'comments', to: "comments#create"
  post '/cartoon/:name/follow', to: "follow#follow", as: "follow_cartoon"
  post '/cartoon/:name/unfollow', to: "follow#unfollow", as: "unfollow_cartoon"
end
