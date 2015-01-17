Rails.application.routes.draw do
  get '/' => 'home#index'

  get 'deathrate' => 'deathrate#index'
  get 'deathrate/countries' => 'deathrate#list_countries'
  get 'deathrate/dates' => 'deathrate#list_dates'
  get 'deathrate/values' => 'deathrate#list_values'
  get 'deathrate/count_fields' => 'deathrate#count_fields'

  get 'birthrate' => 'birthrate#index'
  get 'birthrate/countries' => 'birthrate#list_countries'
  get 'birthrate/dates' => 'birthrate#list_dates'
  get 'birthrate/values' => 'birthrate#list_values'
  get 'birthrate/count_fields' => 'birthrate#count_fields'

  get 'gdp' => 'gdp#index'
  get 'gdp/countries' => 'gdp#list_countries'
  get 'gdp/dates' => 'gdp#list_dates'
  get 'gdp/values' => 'gdp#list_values'
  get 'gdp/count_fields' => 'gdp#count_fields'


  get 'deathrateingest' => 'home#deathrateingest'
  get 'birthrateingest' => 'home#birthrateingest'
  get 'gdpingest' => 'home#gdpingest'

  get 'gdp' => 'gdp#index'

  get 'birthrate' => 'birthrate#index'

  get 'aggregate' => 'aggregate#index'

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
