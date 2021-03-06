Rails.application.routes.draw do

root "users#top"
  devise_for :users

  get 'contacts/finish'
  resources :blogs do
      resources :favorites, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  resources :contacts, only: [:index, :new, :create]
  resources :comments, only: [:create, :update, :edit, :destroy]
  resources :favorites, only: [:index]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
