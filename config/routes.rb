Myapp::Application.routes.draw do
  get "home/index"
  get "home/minor"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

devise_for :admins, controllers: { sessions: 'users/sessions' }, :skip => :registrations
devise_for :users, controllers: { registrations: "users/registrations" , sessions: 'users/sessions' }
root to: 'users#index'
scope :users do
  get '/' => 'users#index', :as => :users
  get '/:id/edit' => 'users#edit', :as => :user_edit
  patch '/:id/update' => 'users#update', :as => :user_update
  post '/change_password' => 'users#change_password', :as => :user_change_password
  get '/confirmation/:token' => 'users#confirmation', :as => :user_confirmation
  patch '/activate' => 'users#activate', :as => :user_activate
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
