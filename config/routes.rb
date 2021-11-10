Rails.application.routes.draw do
  resources :plots, only: [:index]
  
  delete '/plots/:id/plants/:plant_id', to: 'plant_pots#destroy'
end
