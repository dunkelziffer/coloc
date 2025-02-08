Rails.application.routes.draw do
  root "tasks/#index"

  resources :tasks, controller: 'tasks/'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
