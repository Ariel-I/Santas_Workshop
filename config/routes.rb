Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}
  root to: 'application#welcome'
  get 'gifts/most_expensive_gift', to: 'gifts#most_expensive_gift', as: 'meg'

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end 

 
  resources :people, only: [:index, :show] do 
    resources :gifts, only: [:index, :new, :edit, :show]
  end 

  resources :gifts 
end
