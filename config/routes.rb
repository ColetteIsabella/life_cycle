LifeCycle::Application.routes.draw do

  devise_for :users

  root to: "fellowstatuses#index"
    resources :fellowstatuses
    resources :fellows
    resources :statuses

end


