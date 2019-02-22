Rails.application.routes.draw do

root "users#top"
  devise_for :users

  get 'blogs/new_contact_finish'
  resources :blogs
  resources :users
  resources :contacts, only: [:index, :new, :create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
