Rails.application.routes.draw do

  # get '/sits/sitter_response/:id/edit' => 'sits#sitter_response'
  # put 'sitter_response/:id' => 'sits#sitter_update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :sits do
    member do
      get :sitter_response
      put :sitter_update
    end
  end

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"
  get "signup_family" => "users#signup_family"
  get "signup_sitter" => "users#signup_sitter"

  # get "family_login" => "session#family_new"
  # get "family_logout" => "sessions#family_destroy"

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :kids

  resources :sitters do
    collection do
      get :search
    end
  end

  resources :families
  resources :users do
    collection do
      get :route_me
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
