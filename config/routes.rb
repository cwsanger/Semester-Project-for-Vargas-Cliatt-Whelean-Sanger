Rails.application.routes.draw do

  get 'requests/create'

  resources :events

  resources :businesses do
    get 'neighborhoods', to: 'businesses#neighborhoods', as: :neighborhoods
    post 'request/:neighborhood_id', to: 'businesses#join_request', as: :join_request
    get 'display/:id', to: 'businesses#display_stats', as: :display_stats
  end

  resources :agencies do
    get 'neighborhoods', to: 'agencies#neighborhoods', as: :neighborhoods
    post 'request/:neighborhood_id', to: 'agencies#join_request', as: :join_request
  end

  controller :welcome do
    post 'logout' => :logout
    get 'login' => :login
    get 'start' => :start
    get 'search' => :search
    post 'search' => :search
    get 'about' => :about
    get 'contact' => :contact
    get 'doc' => :doc
    get 'password', as: 'password_request'
    post 'password' => :request_pass
    get 'password_reset/:cn' => :confirm, as: 'confirm'
  end

  resources :alerts

  resources :posts, only: [:destroy, :edit, :create]

  get 'demo/' => 'demo#demo_list', as: :demo
  post 'demo/' => 'demo#demo_login'

  get 'admins/', to: 'admins#index', as: :admins

  get 'admins/:id/edit' => 'admins#edit', as: :edit_admin
  get 'admins/:id' => 'admins#edit', as: :admin
  post 'admins/:id' => 'admins#update'
  patch 'admins/:id' => 'admins#update'

  post 'admins/accept/user/:id', to: 'admins#accept_user', as: :admin_accept_user
  post 'admins/deny/user/:id', to: 'admins#deny_user', as: :admin_deny_user

  post 'admins/accept/business/:id', to: 'admins#accept_business', as: :admin_accept_business
  post 'admins/deny/business/:id', to: 'admins#deny_business', as: :admin_deny_business

  post 'admins/accept/agency/:id', to: 'admins#accept_agency', as: :admin_accept_agency
  post 'admins/deny/agency/:id', to: 'admins#deny_agency', as: :admin_deny_agency

  post 'signups/register/business', to: 'signups#create_business', as: :signups_create_business

  post 'signups/register/agency', to: 'signups#create_agency', as: :signups_create_agency

  post 'signups/register/neighborhood', to: 'signups#create', as: :signups

  get 'signups/:id/register', to: 'signups#register_user', as: :signups_user
  post 'signups/:id/register', to: 'signups#join', as: :signups_join

  get 'signups/temps' => 'signups#temps', as: 'temps'

  post 'advertisements/create'

  get 'advertisement/create', as: :create_advertisement

  get 'advertisements/destroy'

  get 'advertisements/edit'

  put 'advertisements/:id/like', to: 'advertisements#like', as: :like_advertisement

  get 'alerts/agencyAlert'

  get 'advertisements/adv'

  put 'posts/:id/like', to: 'posts#like', as: :like_post

  put 'posts/:id/flag', to: 'posts#flag', as: :flag_post

  put 'posts/:id/remove-flag', to: 'posts#remove_flag', as: :remove_flag_post

  post 'comments/:id/create', to: 'comments#create', as: :create_comment

  put 'comments/:id/like', to: 'comments#like', as: :like_comment

  put 'comments/:id/flag', to: 'comments#flag', as: :flag_comment

  put 'comments/:id/remove-flag', to: 'comments#remove_flag', as: :remove_flag_comment

  delete 'comments/:id/destroy', to: 'comments#destroy', as: :destroy_comment

  post 'login/user', to: 'welcome#user_login', as: :user_login

  post 'login/agency', to: 'welcome#agency_login', as: :agency_login

  post 'login/business', to: 'welcome#business_login', as: :business_login

  post 'login/admin', to: 'welcome#admin_login', as: :admin_login

  root 'welcome#start'

  resources :neighborhoods do
    resources :broadcasts, only: [:create, :destroy, :edit]

    post 'lead/:id/accept', to: 'leads#accept', as: :lead_accept
    post 'lead/:id/deny', to: 'leads#deny', as: :lead_deny

    post 'lead/:id/accept-business', to: 'leads#accept_business', as: :lead_accept_business
    post 'lead/:id/deny-business', to: 'leads#deny_business', as: :lead_deny_business

    post 'lead/:id/accept-agency', to: 'leads#accept_agency', as: :lead_accept_agency
    post 'lead/:id/deny-agency', to: 'leads#deny_agency', as: :lead_deny_agency

    get 'category/:id', to: 'neighborhoods#category', as: :category

    get 'admin', to: 'neighborhoods#admin', as: :admin
  end

  get 'direct-message/:id', to: 'direct_messages#show', as: :direct_message
  post 'direct-message/:id/create', to: 'direct_messages#create', as: :create_direct_message

  resources :groups, path: 'chat' do
    post 'add/:user_id', to: 'groups#add_user', as: :add_user
    post 'remove/', to: 'groups#remove_user', as: :remove_user
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
