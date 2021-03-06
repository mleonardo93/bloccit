Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post "/up_vote" => "votes#up_vote", as: :up_vote
    post "/down_vote" => "votes#down_vote", as: :down_vote
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :advertisements
  resources :questions
  get "about" => "welcome#about"
  get 'welcome/contact'
  get 'welcome/faq'
  post 'users/confirm' => 'users#confirm'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
