Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :create, :new, :destroy]
      resources :likes, only: [:create, :new]
    end
  end
end
