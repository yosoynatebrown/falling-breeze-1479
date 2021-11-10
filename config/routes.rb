Rails.application.routes.draw do
  resources :plots, only: [:index]

  resources :gardens, only: [:show]
  
  delete '/plots/:id/plants/:plant_id', to: 'plant_pots#destroy'
end
