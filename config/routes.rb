Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "forum_threads#index"
  resources :forum_threads, only: [:new, :create, :edit, :update] do 
    put 'pinit', on: :member
    resources :forum_posts, only: [:create]
  end
  get '/forum/:slug', to: 'forum_threads#showbyslug', as: 'detail_forum' 
end
