Rails.application.routes.draw do
  root :to => "post#index"
  get '/post' => 'post#json'
  post '/post' => 'post#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
