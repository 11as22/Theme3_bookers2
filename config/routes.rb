Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  #正しく実行されないため、アドレス取得時、ログアウトのアクション実行
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  get 'homes/about' => 'homes#about', as: 'about'
  
  resources :books, only: [:new, :index, :show, :create]
  resources :users, only: [:show, :edit, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
