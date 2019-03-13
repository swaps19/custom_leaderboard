Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leaderboard, only: [:index]
  resources :teams
  resources :events
  resources :team_events, except: [:index]

  root 'leaderboard#index'
end
