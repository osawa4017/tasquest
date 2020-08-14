Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :tasks, except: [:show] do
    collection do
      get 'main'
    end
  end
end
