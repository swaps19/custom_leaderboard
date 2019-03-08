Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leaderboard, only: [:index]
  resources :teams, only: [:show]
  resources :events, only: [:show]

  root 'leaderboard#index'
end
