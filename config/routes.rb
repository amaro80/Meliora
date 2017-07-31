Rails.application.routes.draw do
  get 'site/home'

  get 'site/about'

  get 'site/contact'

  resources :wines
  resources :vineyards
  resources :profiles
  devise_for :users
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  
  post "/wines/get_barcode" => "wines#get_barcode"
  root :to => "site#home"
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  get '/home' => 'site#home'
end