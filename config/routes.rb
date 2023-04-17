Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
    devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    end

  
  
  
  resources :books, only: [:new, :index, :edit, :show, :create, :destroy]
  resources :users, only: [:show, :edit, :index, :create, :destroy]
  
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #正しく実行されないため、アドレス取得時、ログアウトのアクション実行

end
