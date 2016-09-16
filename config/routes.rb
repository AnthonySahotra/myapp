Rails.application.routes.draw do
  
  resources :monsters
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}
  devise_scope :user do
      authenticated :user do
        root :to => 'monsters#index'
      end
      unauthenticated :user do
        root :to => 'devise/sessions#new', as: :unauthenticated_root
      end
  end
end
