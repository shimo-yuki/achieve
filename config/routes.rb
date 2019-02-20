Rails.application.routes.draw do
  devise_for :users
  get 'blogs/new_contact'
  post 'blogs/new_contact', to: 'blogs#new_contact_create'
  post 'blogs/new_contact_confirmation'
  resources :blogs
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
