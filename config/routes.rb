Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    #index, display all products
    get '/products' => 'products#index'
    #show, display one product
    get '/products/:id' => 'products#show'
    #create, make a new product
    post '/products' => 'products#create'
    #update, make a change to an existing product
    patch '/products/:id' => 'products#update'
    #destroy, delete an existing product
    delete '/products/:id' => 'products#destroy'
  end
end
