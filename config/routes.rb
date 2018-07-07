Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "forum_threads#index"
  resources :forum_threads, only: [:new, :show, :create, :edit, :update, :destroy] do 
    put 'pinit', on: :member
    resources :forum_posts, only: [:create]
  end
  resources :users, only: [:show, :edit, :update], as: 'user'
  get '/forum/:slug', to: 'forum_threads#showbyslug', as: 'detail_forum' 
end
