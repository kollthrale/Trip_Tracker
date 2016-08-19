Rails.application.routes.draw do
  
  root to: 'tripps#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tripps do
    resources :locations
      resources :addresses 
    
  end

end
