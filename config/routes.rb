Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create, :new]
    end
  end
end
