Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "pages#home"
  resources :posts do
    member do
      patch '/publish', to: 'posts#publish'
      patch '/unpublish', to: 'posts#unpublish'
    end
  end
  get 'dashboard', to: 'dashboard#index'
end
