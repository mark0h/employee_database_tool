Rails.application.routes.draw do


  get 'profile/index'

  devise_for :users, :controllers => {:registrations => "user/registrations"}
  root 'welcome#index'



  resources :jobs
  resources :welcome, except: [:destroy, :edit, :update, :show, :new, :create]

  get '/profile', to: 'profile#index'
  get '/profile/add_skill', to: 'profile#add_skill'
  get '/profile/remove_skill', to: 'profile#remove_skill'


  get '/job/employee_apply_to_job', to: 'jobs#employee_apply_to_job'
  get '/assign_jobs', to: 'jobs#assign_jobs'
  get '/job/assign_employee', to: 'jobs#assign_employee'
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
