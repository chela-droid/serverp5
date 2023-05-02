Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :categories
  resources :addresses
  resources :admins
  resources :products
  resources :orders
  resources :charts
  post 'authenticate', to: 'authentication#authenticate'
  get '/top_product', to: 'orders#top_product'
  get '/orders_by_date', to: 'orders#orders_by_date'
  get '/average_order_value', to: 'orders#average_order_value'
  get '/orders_per_category', to: 'orders#orders_per_category'
  get '/products/:id/reviews', to: 'reviews#product_reviews'
  get '/invoice/:id', to: 'orders#show_invoice'
  get '/charts/:id/graph', to: 'charts#show_graph'
  post '/reviews/:id', to: 'reviews#create'
  # get '/charts', to: ''
  get '/charts/show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
