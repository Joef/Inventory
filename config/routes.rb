Inventory::Application.routes.draw do
  resources :conversions

  
  resources :recipes

  resources :recipe_menu_items

  resources :menu_items

  resources :measures

  resources :categories

  resources :recipe_ingredients

  resources :ingredients

  resources :invoice_ingredients

  resources :invoices

  resources :vendors
  
  
  root to:'restaurant#index', as: 'restaurant'
  
  #all invoices belong to vendors
  get 'vendors/:id/invoices/new' => 'invoices#new', as: :new_vendor_invoice
  get 'vendors/:vendor_id/invoices/:id/edit' => 'invoices#edit', as: :edit_vendor_invoice
  
  #all conversions belong to a parent measure
  get 'measures/:id/conversions/new' => 'conversions#new', as: :new_measure_conversion
  get 'measures/:measure_id/conversions/:id/edit' => 'conversions#edit', as: :edit_measure_conversion
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
