Rails.application.routes.draw do
  root 'welcome#index'
  get 'parents/:id/pay_tuition', to: "parents#pay_tuition", as: :pay_tuition
  get 'users/welcome_teacher', to: "users#welcome_teacher", as: :welcome_teacher
  get '/health' => 'welcome#health', as: :health
  # get "/auth/google_oauth2/callback", to: "sessions#create"
  resources :rooms, except: [:destroy, :update]
  get "/.well-know/acme-challenge/#{ENV['LE_AUTH_REQUEST']}", to: 'welcome#letsencrypt'
  get "/parents/:id/my_children", to: 'parents#my_children', as: :my_children
  get "/parents/:parent_id/children/:id/my_child_info", to: 'parents#my_child_info', as: :my_child_info
  get "/auth/:provider/callback", to: "sessions#create"
  get 'users/:id/attendees' => "users#attendees", as: :attendees
  get 'users/:id/my_class' => "users#my_class", as: :my_class
  delete "/logout" => "sessions#destroy", as: :logout
  get '/infos/new_forms' => "infos#new_forms", as: :new_forms
  post '/children/email' => "children#send_emails", as: :send_emails
  post '/children/:id/attend' => "children#attend", as: :attend
  post '/children/sms' => "children#send_text_message", as: :send_text_message
  resources :sessions, except: [:update, :destroy]
  resources :infos, except: [:destroy]
  resources :parents, except: [:destroy] do
    resources :children do
      resource :charges
    end
  end

  post '/users' => 'users#welcome', as: :welcome
  resources :users do
    resources :children do
      resources :infos
    end
  end
  resources :children
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
