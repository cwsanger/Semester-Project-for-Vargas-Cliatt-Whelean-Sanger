Rails.application.routes.draw do

  post 'comment/:id/create', to: 'comment#create', as: :create_comment

  put 'comment/:id/like', to: 'comment#like', as: :like_comment

  get 'comment/destroy'

  resources :businesses
  resources :agencies
  controller :welcome do
    post 'logout' => :logout

    get 'login' => :login
    get 'start' => :start
    post 'start' => :post_start
    get 'search' => :search
    get 'about' => :about
    get 'contact' => :contact
    get 'doc' => :doc
  end


  post 'advertisement/create'

  get 'advertisement/create'

  get 'advertisement/destroy'

  get 'advertisement/edit'

  put 'advertisement/:id/like', to: 'advertisement#like', as: :like_advertisement

  get 'broadcast/create'

  get 'broadcast/destroy'

  get 'broadcast/edit'

  get 'alert/create'

  get 'alert/destroy'

  get 'alert/edit'

  get 'post/destroy'

  get 'post/edit'

  post 'post/create'

  put 'post/:id/like', to: 'post#like', as: :like_post

  post 'login/user', to: 'welcome#user_login', as: :user_login

  post 'login/agency', to: 'welcome#agency_login', as: :agency_login

  post 'login/business', to: 'welcome#business_login', as: :business_login

  post 'login/admin', to: 'welcome#admin_login', as: :admin_login

  root 'welcome#start'

  resources :neighborhoods

  resources :groups, path: 'chat' do
    post 'message/create', to: 'message#create', as: :create_message
  end

  resources :users
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
